namespace server.Models
{
    public class User
    {
        public long id { get; set; }
        public string login { get; set; }
        public string password { get; set; }
        public string bio { get; set; }
        public string mail { get; set; }
        public bool active { get; set; }
        public byte[] avatar { get; set; }
        public string register_code{get;set;}
    }
}