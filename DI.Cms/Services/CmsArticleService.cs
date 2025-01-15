using Mapster;
using Microsoft.Extensions.Logging;
using DI.Data;
using DI.Data.Dtos;
using DI.Data.Entities;
using DI.Framework.DependencyInjection;
using DI.Cms.Data.Dtos;
using DI.Cms.Data.Entities;
using DI.Cms.Repositories;

namespace DI.Cms.Services
{    
    /// <summary>
    ///  文章 Service
    ///  author di.net
    ///  date   2025-01-14 13:52:14
    /// </summary>
    public class CmsArticleService : BaseService<CmsArticle, CmsArticleDto>, ITransient
    {
        private readonly ILogger<CmsArticleService> _logger;
        private readonly CmsArticleRepository _cmsArticleRepository;

        public CmsArticleService(ILogger<CmsArticleService> logger,
            CmsArticleRepository cmsArticleRepository)
        {
            BaseRepo = cmsArticleRepository;

            _logger = logger;
            _cmsArticleRepository = cmsArticleRepository;
        }

        /// <summary>
        /// 查询 文章 详情
        /// </summary>
        public async Task<CmsArticle> GetAsync(int id)
        {
            var entity = await base.FirstOrDefaultAsync(e => e.ArticleId == id);
            return entity;
        }

        /// <summary>
        /// 查询 文章 详情
        /// </summary>
        public async Task<CmsArticleDto> GetDtoAsync(int id)
        {
            var entity = await base.FirstOrDefaultAsync(e => e.ArticleId == id);
            var dto = entity.Adapt<CmsArticleDto>();
            // TODO 填充关联表数据
            return dto;
        }
    }
}