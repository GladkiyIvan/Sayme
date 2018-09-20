using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using server.Models;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Authorization;

namespace server.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class PostController : ControllerBase
    {
        readonly ILogger<UserController> log;
        private readonly SaymedbContext context;
        private static long lastPostId = 0;
        public PostController(SaymedbContext context)
        {
            this.context = context;
        }

        [HttpGet("lastpost")]
        public PostTransport GetLastPost()
        {
            var sendingPost = new PostTransport(context.Post.Last());
            foreach (User user in context.User)
            {
                if (sendingPost.id_user == user.id)
                {
                    sendingPost.username = user.login;
                    sendingPost.avatar = user.avatar;
                }
            }
            return sendingPost;
        } 
        [HttpGet("nomoreposts/{id}")]
        public bool CheckForTheLastPost(long id){
            List<Post> posts = context.Post.Where(post => id >= post.id).ToList();
            return posts.Count == 1 ? true: false;
        }

        [HttpGet("lastpostid")]
        public long GetLastPostID() => context.Post.Last().id;

        [HttpGet("next/{id}")]
        public IEnumerable<PostTransport> Get(long id)
        {
            if(lastPostId == id)
            {
                lastPostId = 0;
                return null;
            }
            List<Post> posts = context.Post.OrderByDescending(post => post.id)
                                .Where(post => id > post.id)
                                .Take(20).ToList();
            lastPostId = id;
            
            if(posts.Count == 0)
                return null;
                
            var users = (from u in context.User
                        from p in posts
                        where u.id == p.id_user
                        select u).ToList();

            List<PostTransport> sendingPosts = new List<PostTransport>();

            foreach (Post post in posts)
            {
                sendingPosts.Add(new PostTransport(post));
            }
            
            foreach(PostTransport post in sendingPosts)
            {
                foreach (User user in users)
                {
                    if (post.id_user == user.id)
                    {
                        post.username = user.login;
                        post.avatar=user.avatar;
                    }
                }
            }
            sendingPosts.Reverse();
            return sendingPosts;
        }


        [HttpGet("{id}")]
        public IEnumerable<PostTransport> GetByUserId(long id)
        {
            var posts = context.Post.OrderByDescending(p => p.id).ToList();
            List<PostTransport> sendingPosts = new List<PostTransport>();

            foreach (Post post in posts)
            {
                if (post.id_user == id)
                {
                    sendingPosts.Add(new PostTransport(post));
                }
            }

            foreach(PostTransport post in sendingPosts)
            {
                post.username = "";
            }

            return sendingPosts;
        }


        [HttpPost("last")]
        public IEnumerable<PostTransport> GetNewPosts([FromBody]Id lastPostSiteId)
        {
            var newPosts = context.Post.Where(lastPostDB => lastPostDB.id > lastPostSiteId.id)
                                       .OrderByDescending(p => p.id).ToList();
            if(newPosts.Count == 0)
                return null;
                
            var users = (from p in newPosts
                        from u in context.User
                        where p.id_user == u.id
                        select u).ToList();
        

            List<PostTransport> sendingPosts = new List<PostTransport>();
            
            try
            {
                foreach (Post post in newPosts)
                {
                    sendingPosts.Add(new PostTransport(post));
                }

                foreach(PostTransport post in sendingPosts)
                {
                    foreach(User user in users)
                    {
                        post.username = user.login;
                        post.avatar = user.avatar;
                    }
                }
                return sendingPosts;
            }
            catch(System.Exception)
            {
                // PostTransport p = new PostTransport(new Post()){};
                // p.id = lastPostSiteId.id;
                // p.id_user = 1; //qwerty
                // p.message = "Testing 12345";
                // p.post_date = new System.DateTime();
                return null;
            }
            
        }


        [HttpPost]
        public IActionResult Post([FromBody]Post postTransport)
        {
            if(ModelState.IsValid)
            {
                context.Post.Add(postTransport);
                context.SaveChanges();
                return Ok(postTransport);
            }
            return BadRequest(ModelState);
        } 
        
        [Route("update")]
        [HttpPost]
        public IActionResult Update([FromBody]Post postTransport)
        {
            if(ModelState.IsValid)
            {
                var editedPost = context.Post
                    .Where(c => c.id == postTransport.id)
                    .FirstOrDefault();
                editedPost.message = postTransport.message;
                context.SaveChanges();
                return Ok();
            }
            return BadRequest(ModelState);
        }
    }
    
}