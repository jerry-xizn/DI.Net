using DI.Data;
using DI.Cms.Data.Dtos;
using DI.Cms.Data.Entities;
using SqlSugar;

namespace DI.Cms.Repositories
{
    /// <summary>
    ///  文章 Repository
    ///  author di.net
    ///  date   2025-01-14 13:52:14
    /// </summary>
    public class CmsArticleRepository : BaseRepository<CmsArticle, CmsArticleDto>
    {
        public CmsArticleRepository(ISqlSugarRepository<CmsArticle> sqlSugarRepository)
        {
            Repo = sqlSugarRepository;
        }

        public override ISugarQueryable<CmsArticle> Queryable(CmsArticleDto dto)
        {
            return Repo.AsQueryable()
                .WhereIF(dto.ArticleId > 0, (t) => t.ArticleId == dto.ArticleId)
            ;
        }

        public override ISugarQueryable<CmsArticleDto> DtoQueryable(CmsArticleDto dto)
        {
            return Repo.AsQueryable()
                .WhereIF(dto.ArticleId > 0, (t) => t.ArticleId == dto.ArticleId)
                .Select((t) => new CmsArticleDto
                {
                     ArticleId = t.ArticleId 
                }, true);
        }
    }
}