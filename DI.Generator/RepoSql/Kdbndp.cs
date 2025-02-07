using DI.Generator.Dtos;

namespace DI.Generator.RepoSql
{
    /// <summary>
    /// 人大金仓
    /// </summary>
    public class Kdbndp : IDbSql, ITransient
    {
        // Table 查询
        public SqlAndParameter GetDbTableListSqlAndParameter(GenTableDto dto)
        {
            var sql = $@"
                SELECT c.relname AS table_name,
                       obj_description(c.oid) AS table_comment, 
                       SYSDATE AS create_time, 
                       SYSDATE AS update_time 
                FROM pg_class c
                JOIN pg_namespace n ON c.relnamespace = n.oid
                WHERE n.nspname = current_schema() AND c.relkind = 'r'
                  AND c.relname NOT LIKE 'qrtz_%' 
                  AND c.relname NOT LIKE 'gen_%'
                  AND c.relname NOT IN (SELECT table_name FROM gen_table)
            ";
            var parameters = new List<SugarParameter>();
            if (!string.IsNullOrEmpty(dto.TableName))
            {
                sql += "AND lower(c.relname) LIKE lower(concat('%', @tableName, '%'))";
                parameters.Add(new SugarParameter("@tableName", dto.TableName));
            }
            if (!string.IsNullOrEmpty(dto.TableComment))
            {
                sql += "AND lower(obj_description(c.oid)) LIKE lower(concat('%', @tableComment, '%'))";
                parameters.Add(new SugarParameter("@tableComment", dto.TableComment));
            }
            if (dto.Params.BeginTime != null)
            {
                // 在人大金仓数据库上未实现对这个字段的查询
                //sql += "AND date_format(create_time,'%y%m%d') >= date_format(@BeginTime,'%y%m%d')";
                //parameters.Add(new SugarParameter("@BeginTime", dto.Params.BeginTime));
            }
            if (dto.Params.BeginTime != null)
            {
                // 在人大金仓数据库上未实现对这个字段的查询
                //sql += "AND date_format(create_time,'%y%m%d') <= date_format(@EndTime,'%y%m%d')";
                //parameters.Add(new SugarParameter("@EndTime", dto.Params.EndTime));
            }

            return new SqlAndParameter
            {
                Sql = sql,
                Parameters = parameters
            };
        }

        // Table: 按名字查询
        public string GetDbTableListByNamesSql()
        {
            return $@"
                SELECT c.relname AS table_name,
                       obj_description(c.oid) AS table_comment, 
                       SYSDATE AS create_time, 
                       SYSDATE AS update_time 
                FROM pg_class c
                JOIN pg_namespace n ON c.relnamespace = n.oid
                WHERE n.nspname = current_schema() AND c.relkind = 'r'
                  AND c.relname NOT LIKE 'qrtz_%' 
                  AND c.relname NOT LIKE 'gen_%'
                  AND c.relname IN (@tableNames)
            ";
        }

        // 列 按table名称查询
        public string GetDbTableColumnsByName()
        {
            return $@"
                SELECT 
	                a.attname AS column_name
	                ,case a.attnotnull when 't' then 1 when 'f' then 0  else  0 end  AS is_required, 
	                CASE  WHEN con.contype = 'p' THEN 1 ELSE 0 END AS is_pk,
	                a.attnum AS sort,
	                (SELECT description FROM pg_description pd WHERE pd.objoid = c.oid AND pd.objsubid = a.attnum) AS column_comment,
	                CASE a.attidentity WHEN 'd' THEN 1 ELSE 0 END AS is_increment,
	                pg_catalog.format_type(a.atttypid, a.atttypmod) AS column_type
                FROM pg_catalog.pg_attribute a 
                JOIN pg_catalog.pg_class c ON a.attrelid = c.oid
                JOIN pg_namespace n ON c.relnamespace = n.oid
                LEFT JOIN 
                    pg_constraint con ON c.oid = con.conrelid AND con.contype = 'p' AND a.attnum = ANY (con.conkey)    
                WHERE n.nspname = current_schema() AND c.relkind = 'r' AND 
                    c.relname = (@tableName)
                    AND a.attnum > 0  
                    AND NOT a.attisdropped
                ORDER BY 
                    a.attnum
            ";
        }
    }
}
