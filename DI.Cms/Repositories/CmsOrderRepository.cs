using DI.Data;
using DI.Cms.Data.Dtos;
using DI.Cms.Data.Entities;
using SqlSugar;

namespace DI.Cms.Repositories
{
    /// <summary>
    ///  订单表 Repository
    ///  author di.net
    ///  date   2025-01-24 14:01:14
    /// </summary>
    public class CmsOrderRepository : BaseRepository<CmsOrder, CmsOrderDto>
    {
        public CmsOrderRepository(ISqlSugarRepository<CmsOrder> sqlSugarRepository)
        {
            Repo = sqlSugarRepository;
        }

        public override ISugarQueryable<CmsOrder> Queryable(CmsOrderDto dto)
        {
            return Repo.AsQueryable()
                .WhereIF(dto.Id > 0, (t) => t.Id == dto.Id)
            ;
        }

        public override ISugarQueryable<CmsOrderDto> DtoQueryable(CmsOrderDto dto)
        {
            return Repo.AsQueryable()
                .WhereIF(dto.Id > 0, (t) => t.Id == dto.Id)
                .WhereIF(!string.IsNullOrEmpty(dto.OrderNo), (c) => c.OrderNo!.Contains(dto.OrderNo!))
                .WhereIF(!string.IsNullOrEmpty(dto.CustomerName), (c) => c.OrderNo!.Contains(dto.CustomerName!))
                .WhereIF(!string.IsNullOrEmpty(dto.CustomerPhone), (c) => c.OrderNo!.Contains(dto.CustomerPhone!))
                .WhereIF(!string.IsNullOrEmpty(dto.CustomerAddress), (c) => c.OrderNo!.Contains(dto.CustomerAddress!))
                .Select((t) => new CmsOrderDto
                {
                    Id = t.Id
                }, true);
        }
    }
}