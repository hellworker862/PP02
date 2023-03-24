using PP02.Data.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace PP02.Data.Repositories
{
    public class EntryRepository
    {
        DataBase _dataBase;

        public EntryRepository()
        {
            _dataBase = new DataBase();
        }

        public async Task<DataTable> GetUpcomingEntriesAsync()
        {
            var query = @"select s.Title as 'наименование услуги,', CONCAT(c.LastName, ' ', c.FirstName, ' ', c.Patronymic) as 'ФИО клиента', c.Email as 'email', c.Phone as 'телефон', convert(varchar, cs.StartTime, 120) as 'время записи', CONCAT(datediff(MINUTE, GETDATE(), cs.StartTime) / 60, ' часов ', datediff(MINUTE, GETDATE(), cs.StartTime) % 60, ' минуты	') as 'осталось времени' from ClientService cs 
                          join Client c on c.ID = cs.ClientID
                          join Service s on s.ID = cs.ServiceID
                          where datediff(SECOND, GETDATE(), cs.StartTime) >= 0 and datediff(MINUTE, GETDATE(), cs.StartTime) <= 2880
                          Order By cs.StartTime";
            return await _dataBase.SelectQueryAsync(query);
        }

        public async Task<List<Client>> GetAllClientAsync()
        {
            var query = "select id as 'Id', concat(LastName, ' ', FirstName, ' ', Patronymic) as 'Fio' from Client";
            var list = new List<Client>();
            var result = await _dataBase.SelectQueryAsync(query);

            foreach (DataRow row in result.Rows)
            {
                int id = (int)row[0];
                string fio = (string)row[1];

                var tmp = new Client()
                {
                    Id = id,
                    Fio = fio,
                };
                list.Add(tmp);
            }

            return list;
        }

        public async Task CreateEntryAsync(EntryModel newEntry)
        {
            var param1 = new SqlParameter();
            param1.ParameterName = "@сlientID";
            param1.DbType = DbType.Int32;
            param1.Value = newEntry.ClientId;
            var param2 = new SqlParameter();
            param2.ParameterName = "@serviceID";
            param2.DbType = DbType.Int32;
            param2.Value = newEntry.ServiceId;
            var param3 = new SqlParameter();
            param3.ParameterName = "@startTime";
            param3.DbType = DbType.DateTime;
            param3.Value = newEntry.StartTime;
            SqlParameter[] parameters =
            {
                param1,
                param2,
                param3,
            };
            var query = "INSERT INTO ClientService(ClientID, ServiceID, StartTime) VALUES (@сlientID, @serviceID, @startTime)";
            await _dataBase.InsertQueryAsync(query, parameters);
        }
    }
}
