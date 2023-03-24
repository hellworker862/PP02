using System;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace PP02.Data
{
    public class DataBase
    {
        private const string _stringConnection = @"Data Source=MyPc;Initial Catalog=pp02Bd;Integrated Security=True;TrustServerCertificate=true;MultipleActiveResultSets=True";
        private SqlDataAdapter _adapter;

        public DataBase()
        {
            _adapter = new SqlDataAdapter();
        }

        private async Task<SqlConnection> OpenConnectionAsync()
        {
            var connection = new SqlConnection(_stringConnection);
            await connection.OpenAsync();

            return connection;
        }

        private SqlConnection OpenConnection()
        {
            var connection = new SqlConnection(_stringConnection);
            connection.Open();

            return connection;
        }

        public async Task<DataTable> SelectQueryAsync(string query, SqlParameter[] parameters = null)
        {
            SqlCommand cmd = new SqlCommand();
            DataTable dt = null;
            DataSet ds = new DataSet();
            SqlConnection connection = await OpenConnectionAsync();

            try
            {
                cmd.Connection = connection;
                cmd.CommandText = query;
                if (parameters != null) cmd.Parameters.AddRange(parameters);
                await cmd.ExecuteNonQueryAsync();
                _adapter.SelectCommand = cmd;
                _adapter.Fill(ds);
                dt = ds.Tables[0];
            }
            catch (Exception ex)
            {
                connection.Close();
                throw new Exception(ex.Message);
            }
            connection.Close();

            return dt;
        }

        public async Task<bool> InsertQueryAsync(string query, SqlParameter[] parameters = null)
        {
            SqlCommand cmd = new SqlCommand();
            SqlConnection connection = await OpenConnectionAsync();

            try
            {
                cmd.Connection = connection;
                cmd.CommandText = query;
                if (parameters != null) cmd.Parameters.AddRange(parameters);
                _adapter.InsertCommand = cmd;
                await cmd.ExecuteNonQueryAsync();
            }
            catch (Exception ex)
            {
                connection.Close();
                throw new Exception(ex.Message);
            }
            connection.Close();

            return true;
        }

        public async Task<bool> UpdateQueryAsync(string query, SqlParameter[] parameters = null)
        {
            SqlCommand cmd = new SqlCommand();
            SqlConnection connection = await OpenConnectionAsync();

            try
            {
                cmd.Connection = connection;
                cmd.CommandText = query;
                if (parameters != null) cmd.Parameters.AddRange(parameters);
                _adapter.UpdateCommand = cmd;
                await cmd.ExecuteNonQueryAsync();
            }
            catch (Exception ex)
            {
                connection.Close();
                throw new Exception(ex.Message);
            }
            connection.Close();
            return true;
        }

        public async Task<bool> DeleteQueryAsync(string query, SqlParameter[] parameters = null)
        {
            SqlCommand cmd = new SqlCommand();
            SqlConnection connection = await OpenConnectionAsync();

            try
            {
                cmd.Connection = connection;
                cmd.CommandText = query;
                if (parameters != null) cmd.Parameters.AddRange(parameters);
                _adapter.DeleteCommand = cmd;
                await cmd.ExecuteNonQueryAsync();
            }
            catch (Exception ex)
            {
                connection.Close();
                throw new Exception(ex.Message);
            }
            connection.Close();

            return true;
        }

        public DataTable SelectQuery(string query, SqlParameter[] parameters = null)
        {
            SqlCommand cmd = new SqlCommand();
            DataTable dt = null;
            DataSet ds = new DataSet();
            SqlConnection connection = OpenConnection();

            try
            {
                cmd.Connection = connection;
                cmd.CommandText = query;
                if (parameters != null) cmd.Parameters.AddRange(parameters);
                cmd.ExecuteNonQuery();
                _adapter.SelectCommand = cmd;
                _adapter.Fill(ds);
                dt = ds.Tables[0];
            }
            catch (Exception ex)
            {
                connection.Close();
                throw new Exception(ex.Message);
            }
            connection.Close();

            return dt;
        }

        public bool InsertQuery(string query, SqlParameter[] parameters = null)
        {
            SqlCommand cmd = new SqlCommand();
            SqlConnection connection = OpenConnection();

            try
            {
                cmd.Connection = connection;
                cmd.CommandText = query;
                if (parameters != null) cmd.Parameters.AddRange(parameters);
                _adapter.InsertCommand = cmd;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                connection.Close();
                throw new Exception(ex.Message);
            }
            connection.Close();

            return true;
        }

        public bool UpdateQuery(string query, SqlParameter[] parameters = null)
        {
            SqlCommand cmd = new SqlCommand();
            SqlConnection connection = OpenConnection();

            try
            {
                cmd.Connection = connection;
                cmd.CommandText = query;
                if (parameters != null) cmd.Parameters.AddRange(parameters);
                _adapter.UpdateCommand = cmd;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                connection.Close();
                throw new Exception(ex.Message);
            }
            connection.Close();
            return true;
        }

        public bool DeleteQuery(string query, SqlParameter[] parameters = null)
        {
            SqlCommand cmd = new SqlCommand();
            SqlConnection connection = OpenConnection();

            try
            {
                cmd.Connection = connection;
                cmd.CommandText = query;
                if (parameters != null) cmd.Parameters.AddRange(parameters);
                _adapter.DeleteCommand = cmd;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                connection.Close();
                throw new Exception(ex.Message);
            }
            connection.Close();

            return true;
        }
    }
}
