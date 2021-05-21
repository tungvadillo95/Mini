using System.Data;
using System.Data.SqlClient;

namespace CB.DAL.Implement
{
    public class BaseRepository
    {
        protected IDbConnection connection;
        public BaseRepository()
        {
            connection = new SqlConnection(@"Data Source=AITD201412002;Initial Catalog=ContactBookDb;Integrated Security=True");
            //connection = new SqlConnection(@"workstation id=ContactBookDbContext.mssql.somee.com;packet size=4096;user id=vadillopro95_SQLLogin_1;pwd=trz6gse6up;data source=ContactBookDbContext.mssql.somee.com;persist security info=False;initial catalog=ContactBookDbContext");
        }
    }
}
