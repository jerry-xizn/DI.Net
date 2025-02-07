using DI.Data;
using DI.System.Data.Dtos;
using DI.System.Data.Entities;
using SqlSugar;

namespace DI.System.Repositories
{
    /// <summary>
    ///  订单明细表 Repository
    ///  author di.net
    ///  date   2025-01-24 13:57:34
    /// </summary>
    public class CmsOrderDetailRepository : BaseRepository<CmsOrderDetail, CmsOrderDetailDto>
    {
        public CmsOrderDetailRepository(ISqlSugarRepository<CmsOrderDetail> sqlSugarRepository)
        {
            Repo = sqlSugarRepository;
        }

        public override ISugarQueryable<CmsOrderDetail> Queryable(CmsOrderDetailDto dto)
        {
            return Repo.AsQueryable()
                .WhereIF(dto.Id > 0, (t) => t.Id == dto.Id)
            ;
        }

        public override ISugarQueryable<CmsOrderDetailDto> DtoQueryable(CmsOrderDetailDto dto)
        {
            return Repo.AsQueryable()
                .WhereIF(dto.Id > 0, (t) => t.Id == dto.Id)
                .WhereIF(dto.OrderId > 0, (t) => t.OrderId == dto.OrderId)
                .Select((t) => new CmsOrderDetailDto
                {
                     Id = t.Id 
                }, true);
        }
    }
}