using DI.Data;
using DI.Cms.Data.Dtos;
using DI.Cms.Data.Entities;
using SqlSugar;

namespace DI.Cms.Repositories
{
    /// <summary>
    ///  新闻管理 Repository
    ///  author di.net
    ///  date   2025-01-14 17:08:44
    /// </summary>
    public class CmsNewsRepository : BaseRepository<CmsNews, CmsNewsDto>
    {
        public CmsNewsRepository(ISqlSugarRepository<CmsNews> sqlSugarRepository)
        {
            Repo = sqlSugarRepository;
        }

        public override ISugarQueryable<CmsNews> Queryable(CmsNewsDto dto)
        {
            return Repo.AsQueryable()
                .WhereIF(dto.NewsId > 0, (t) => t.NewsId == dto.NewsId)
            ;
        }

        public override ISugarQueryable<CmsNewsDto> DtoQueryable(CmsNewsDto dto)
        {
            return Repo.AsQueryable()
                .WhereIF(dto.NewsId > 0, (t) => t.NewsId == dto.NewsId)
                .Select((t) => new CmsNewsDto
                {
                     NewsId = t.NewsId 
                }, true);
        }
    }
}