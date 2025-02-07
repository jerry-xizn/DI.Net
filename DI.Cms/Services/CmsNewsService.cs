using Mapster;
using Microsoft.Extensions.Logging;
using DI.Data;
using DI.Data.Dtos;
using DI.Data.Entities;
using DI.Framework.DependencyInjection;
using DI.Cms.Data.Dtos;
using DI.Cms.Data.Entities;
using DI.Cms.Repositories;
using System.Diagnostics;
using DI.System.Repositories;

namespace DI.Cms.Services
{
    /// <summary>
    ///  新闻管理 Service
    ///  author di.net
    ///  date   2025-01-21 15:06:29
    /// </summary>
    public class CmsNewsService : BaseService<CmsNews, CmsNewsDto>, ITransient
    {
        private readonly ILogger<CmsNewsService> _logger;
        private readonly CmsNewsRepository _cmsNewsRepository;

        public CmsNewsService(ILogger<CmsNewsService> logger,
            CmsNewsRepository cmsNewsRepository)
        {
            BaseRepo = cmsNewsRepository;

            _logger = logger;
            _cmsNewsRepository = cmsNewsRepository;
        }

        /// <summary>
        /// 查询 新闻管理 详情
        /// </summary>
        public async Task<CmsNews> GetAsync(long id)
        {
            var entity = await base.FirstOrDefaultAsync(e => e.NewsId == id);
            return entity;
        }

        /// <summary>
        /// 查询 新闻管理 详情
        /// </summary>
        public async Task<CmsNewsDto> GetDtoAsync(long id)
        {
            var entity = await base.FirstOrDefaultAsync(e => e.NewsId == id);
            var dto = entity.Adapt<CmsNewsDto>();
            // TODO 填充关联表数据
            return dto;
        }

        public override async Task<int> UpdateAsync(CmsNewsDto entity)
        {
            return await _cmsNewsRepository.UpdateAsync(entity, isExecuteCommandWithOptLock: true);
        }
    }
}