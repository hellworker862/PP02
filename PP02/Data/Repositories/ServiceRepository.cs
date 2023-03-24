using PP02.Data.Enums;
using PP02.Data.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Reflection;
using System.Security.Cryptography;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace PP02.Data.Repositories
{
    public class ServiceRepository
    {
        private readonly DataBase _dataBase;

        public ServiceRepository()
        {
            _dataBase = new DataBase();
        }

        public async Task<ServiceModel> GetServiceByIdAsync(int id)
        {
            var param1 = new SqlParameter();
            param1.ParameterName = "@id";
            param1.DbType = DbType.Int32;
            param1.SqlValue = id;
            SqlParameter[] parameters =
            {
                param1,
            };
            var query = "SELECT Title, Cost, DurationInSeconds, Description, Discount, MainImagePath FROM Service WHERE ID = @id";
            var result = await _dataBase.SelectQueryAsync(query, parameters);
            ServiceModel model = null;

            if (result.Rows.Count > 0)
            {
                DataRow row = result.Rows[0];
                string title = (string)row[0];
                decimal cost = (decimal)row[1];
                int durationInSeconds = (int)row[2];
                string description = row[3] is DBNull ? null : (string)row[3];
                double discount = row[4] is DBNull ? 0 : (double)row[4];
                string mainImagePath = row[5] is DBNull ? null : (string)row[5];
                model = new ServiceModel()
                {
                    Id = id,
                    Title = title,
                    Cost = cost,
                    Description = description,
                    Discount = discount,
                    MainImagePath = mainImagePath,
                    DuraDurationInSeconds = durationInSeconds,
                };
            }

            return model;
        }

        public async Task<ServiceModel> GetServiceByIdWithPhotosAsync(int id)
        {
            var param1 = new SqlParameter();
            param1.ParameterName = "@id";
            param1.DbType = DbType.Int32;
            param1.SqlValue = id;
            SqlParameter[] parameters =
            {
                param1,
            };
            var query = "SELECT Title, Cost, DurationInSeconds, Description, Discount, MainImagePath FROM Service WHERE ID = @id";
            var result = await _dataBase.SelectQueryAsync(query, parameters);
            ServiceModel model = null;

            if (result.Rows.Count > 0)
            {
                DataRow row = result.Rows[0];
                var title = (string)row[0];
                var cost = (decimal)row[1];
                var durationInSeconds = (int)row[2];
                var description = row[3] is DBNull ? null : (string)row[3];
                double discount = row[4] is DBNull ? 0 : (double)row[4];
                var mainImagePath = row[5] is DBNull ? null : (string)row[5];
                model = new ServiceModel()
                {
                    Id = id,
                    Title = title,
                    Cost = cost,
                    Description = description,
                    Discount = discount,
                    MainImagePath = mainImagePath,
                    DuraDurationInSeconds = durationInSeconds,
                    Photos = new List<ServicePhotoModel>(),
                };

                var param2 = new SqlParameter();
                param2.ParameterName = "@id";
                param2.DbType = DbType.Int32;
                param2.SqlValue = id;
                SqlParameter[] parameters2 =
                {
                    param2,
                };

                query = "SELECT ID, PhotoPath FROM ServicePhoto WHERE ServiceID = @id";
                result = await _dataBase.SelectQueryAsync(query, parameters2);
                foreach (DataRow item in result.Rows)
                {
                    var idPhoto = (int)item[0];
                    var path = (string)item[1];

                    var photo = new ServicePhotoModel()
                    {
                        Id = idPhoto,
                        Path = path,
                    };
                    model.Photos.Add(photo);
                }
            }

            return model;
        }

        public async Task<List<ServiceModel>> GetAllServicesAsync(Sort sort = Sort.OrderByCost)
        {
            var query = "SELECT ID, Title, Cost, DurationInSeconds, Description, Discount, MainImagePath FROM Service";
            switch (sort)
            {
                case Sort.OrderByCost:
                    query += " ORDER BY (Cost - Cost* Discount) ASC";
                    break;
                case Sort.OrderByDescendingCost:
                    query += " ORDER BY (Cost - Cost* Discount) DESC";
                    break;
                default:
                    break;
            }
            var result = await _dataBase.SelectQueryAsync(query);
            List<ServiceModel> services = new List<ServiceModel>();

            foreach (DataRow row in result.Rows)
            {
                int id = (int)row[0];
                string title = (string)row[1];
                decimal cost = (decimal)row[2];
                int durationInSeconds = (int)row[3];
                string description = row[4] is DBNull ? null : (string)row[4];
                double discount = row[5] is DBNull ? 0 : (double)row[5];
                string mainImagePath = row[6] is DBNull ? null : (string)row[6];
                var model = new ServiceModel()
                {
                    Id = id,
                    Title = title,
                    Cost = cost,
                    Description = description,
                    Discount = discount,
                    MainImagePath = mainImagePath,
                    DuraDurationInSeconds = durationInSeconds,
                };
                services.Add(model);
            }

            return services;
        }

        public async Task<List<ServiceModel>> GetServicesByFilterAndSearchStringAsync(FilterDiscount filterDiscount = FilterDiscount.None, string searchString = "", Sort sort = Sort.OrderByCost)
        {
            var param1 = new SqlParameter();
            param1.ParameterName = "@searchString";
            param1.DbType = DbType.String;
            param1.SqlValue = searchString;
            SqlParameter[] parameters =
            {
                param1,
            };

            var query = "SELECT ID, Title, Cost, DurationInSeconds, Description, Discount, MainImagePath FROM Service";

            switch (filterDiscount)
            {
                case FilterDiscount.None:
                    query += " WHERE Title LIKE '%' + @searchString + '%' or Description LIKE '%' + @searchString + '%'";
                    break;
                case FilterDiscount.From0To5:
                    query += " WHERE Discount >= 0 and Discount < 0.05 and Title LIKE '%' + @searchString + '%' or Description LIKE '%' + @searchString + '%'";
                    break;
                case FilterDiscount.From5To15:
                    query += " WHERE Discount >= 0.05 and Discount < 0.15 and Title LIKE '%' + @searchString + '%' or Description LIKE '%' + @searchString + '%'";
                    break;
                case FilterDiscount.From15To30:
                    query += " WHERE Discount >= 0.15 and Discount < 0.3 and Title LIKE '%' + @searchString + '%' or Description LIKE '%' + @searchString + '%'";
                    break;
                case FilterDiscount.From30To70:
                    query += " WHERE Discount >= 0.3 and Discount < 0.7 and Title LIKE '%' + @searchString + '%' or Description LIKE '%' + @searchString + '%'";
                    break;
                case FilterDiscount.From70To100:
                    query += " WHERE Discount >= 0.7 and Discount < 1 and Title LIKE '%' + @searchString + '%' or Description LIKE '%' + @searchString + '%'";
                    break;
                default:
                    query += " WHERE Title LIKE '%' + @searchString + '%' or Description LIKE '%' + @searchString + '%'";
                    break;
            }

            switch (sort)
            {
                case Sort.OrderByCost:
                    query += " ORDER BY (Cost - Cost* Discount) DESC";
                    break;
                case Sort.OrderByDescendingCost:
                    query += " ORDER BY (Cost - Cost* Discount) ASC";
                    break;
                default:
                    break;
            }

            var result = await _dataBase.SelectQueryAsync(query, parameters);
            List<ServiceModel> services = new List<ServiceModel>();

            foreach (DataRow row in result.Rows)
            {
                int id = (int)row[0];
                string title = (string)row[1];
                decimal cost = (decimal)row[2];
                int durationInSeconds = (int)row[3];
                string description = row[4] is DBNull ? null : (string)row[4];
                double discount = row[5] is DBNull ? 0 : (double)row[5];
                string mainImagePath = row[6] is DBNull ? null : (string)row[6];
                var model = new ServiceModel()
                {
                    Id = id,
                    Title = title,
                    Cost = cost,
                    Description = description,
                    Discount = discount,
                    MainImagePath = mainImagePath,
                    DuraDurationInSeconds = durationInSeconds,
                };
                services.Add(model);
            }

            return services;
        }

        public async Task CreateServiceAsync(ServiceModel model)
        {
            var param1 = new SqlParameter();
            param1.ParameterName = "@title";
            param1.DbType = DbType.String;
            param1.SqlValue = model.Title;
            var param2 = new SqlParameter();
            param2.ParameterName = "@cost";
            param2.DbType = DbType.Decimal;
            param2.SqlValue = model.Cost;
            var param3 = new SqlParameter();
            param3.ParameterName = "@discount";
            param3.DbType = DbType.Double;
            param3.SqlValue = model.Discount;
            var param4 = new SqlParameter();
            param4.ParameterName = "@description";
            param4.DbType = DbType.String;

            if (String.IsNullOrEmpty(model.Description))
            {
                param4.SqlValue = DBNull.Value;
            }
            else
            {
                param4.SqlValue = model.Description;
            }
            var param5 = new SqlParameter();
            param5.ParameterName = "@mainImagePath";
            param5.DbType = DbType.String;

            if (String.IsNullOrEmpty(model.MainImagePath))
            {
                param5.SqlValue = DBNull.Value;
            }
            else
            {
                param5.SqlValue = model.MainImagePath;
            }
            var param6 = new SqlParameter();
            param6.ParameterName = "@durationInSeconds";
            param6.DbType = DbType.Int32;
            param6.SqlValue = model.DuraDurationInSeconds;
            SqlParameter[] parameters =
            {
                param1,
                param2,
                param3,
                param4,
                param5,
                param6,
            };
            var query = "INSERT INTO Service(Title, Cost, DurationInSeconds, Description, Discount, MainImagePath) VALUES (@title, @cost, @durationInSeconds, @description, @discount, @mainImagePath)";
            await _dataBase.InsertQueryAsync(query, parameters);
        }

        public async Task<int> GetLastIdAsync()
        {
            var query = "SELECT IDENT_CURRENT('Service')";
            var result = await _dataBase.SelectQueryAsync(query);

            return Convert.ToInt32(result.Rows[0][0]);
        }

        public async Task<bool> CheckTitleUniquenessAsync(string title)
        {
            var param1 = new SqlParameter();
            param1.ParameterName = "@title";
            param1.DbType = DbType.String;
            param1.SqlValue = title;
            SqlParameter[] parameters =
            {
                param1,
            };
            var query = "SELECT count(Title) FROM Service WHERE Title = @title";
            var result = await _dataBase.SelectQueryAsync(query, parameters);

            return (int)result.Rows[0][0] == 0;
        }

        public async Task UpdateServiceAsync(ServiceModel updateModel)
        {
            var param1 = new SqlParameter();
            param1.ParameterName = "@title";
            param1.DbType = DbType.String;
            param1.SqlValue = updateModel.Title;
            var param2 = new SqlParameter();
            param2.ParameterName = "@cost";
            param2.DbType = DbType.Decimal;
            param2.SqlValue = updateModel.Cost;
            var param3 = new SqlParameter();
            param3.ParameterName = "@discount";
            param3.DbType = DbType.Double;
            param3.SqlValue = updateModel.Discount;
            var param4 = new SqlParameter();
            param4.ParameterName = "@description";
            param4.DbType = DbType.String;

            if (String.IsNullOrEmpty(updateModel.Description))
            {
                param4.SqlValue = DBNull.Value;
            }
            else
            {
                param4.SqlValue = updateModel.Description;
            }
            var param5 = new SqlParameter();
            param5.ParameterName = "@durationInSeconds";
            param5.DbType = DbType.Int32;
            param5.SqlValue = updateModel.DuraDurationInSeconds;
            var param6 = new SqlParameter();
            param6.ParameterName = "@id";
            param6.DbType = DbType.Int32;
            param6.SqlValue = updateModel.Id;
            SqlParameter[] parameters =
            {
                param1,
                param2,
                param3,
                param4,
                param5,
                param6,
            };

            var query = "UPDATE Service SET Title = @title, Cost = @cost, Description = @description, DurationInSeconds = @durationInSeconds, Discount = @discount WHERE ID = @id";
            await _dataBase.UpdateQueryAsync(query, parameters);
        }

        public async Task UpdateImageServiceAsync(int id, string imageName)
        {
            var param1 = new SqlParameter();
            param1.ParameterName = "@imageName";
            param1.DbType = DbType.String;
            param1.SqlValue = imageName;
            var param2 = new SqlParameter();
            param2.ParameterName = "@id";
            param2.DbType = DbType.Int32;
            param2.SqlValue = id;
            SqlParameter[] parameters =
            {
                param1,
                param2,
            };
            var query = "UPDATE Service SET MainImagePath = @imageName WHERE ID = @id";
            await _dataBase.UpdateQueryAsync(query, parameters);
        }

        public async Task AddPhotoServiceAsync(int id, string imageName)
        {
            var param1 = new SqlParameter();
            param1.ParameterName = "@imageName";
            param1.DbType = DbType.String;
            param1.SqlValue = imageName;
            var param2 = new SqlParameter();
            param2.ParameterName = "@id";
            param2.DbType = DbType.Int32;
            param2.SqlValue = id;
            SqlParameter[] parameters =
            {
                param1,
                param2,
            };
            var query = "INSERT INTO ServicePhoto(ServiceID, PhotoPath) VALUES (@id, @imageName)";
            await _dataBase.InsertQueryAsync(query, parameters);
        }

        public async Task DeletePhotoServiceAsync(int id)
        {
            var param1 = new SqlParameter();
            param1.ParameterName = "@id";
            param1.DbType = DbType.Int32;
            param1.SqlValue = id;
            SqlParameter[] parameters =
            {
                param1,
            };
            var query = "DELETE FROM ServicePhoto WHERE ID = @id";
            await _dataBase.DeleteQueryAsync(query, parameters);
        }

        public async Task<bool> CanBeDeleteServiceAsync(int id)
        {
            var param1 = new SqlParameter();
            param1.ParameterName = "@id";
            param1.DbType = DbType.Int32;
            param1.SqlValue = id;
            SqlParameter[] parameters =
            {
                param1,
            };
            var query = "SELECT count(id) FROM ClientService WHERE ServiceID = @id";

            return (int)(await _dataBase.SelectQueryAsync(query, parameters)).Rows[0][0] == 0;
        }

        public async Task DeleteServiceAsync(int id)
        {
            var param1 = new SqlParameter();
            param1.ParameterName = "@serviceId";
            param1.DbType = DbType.Int32;
            param1.SqlValue = id;
            SqlParameter[] parameters1 =
            {
                param1,
            };
            var query = "DELETE FROM ServicePhoto WHERE ServiceID = @serviceId";
            await _dataBase.DeleteQueryAsync(query, parameters1);

            var param2 = new SqlParameter();
            param2.ParameterName = "@id";
            param2.DbType = DbType.Int32;
            param2.SqlValue = id;
            SqlParameter[] parameters2 =
            {
                param2,
            };
            query = "DELETE FROM Service WHERE ID = @id";
            await _dataBase.DeleteQueryAsync(query, parameters2);
        }
    }
}
