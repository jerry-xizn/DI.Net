using Mapster;
using Microsoft.Extensions.Logging;
using DI.Data;
using DI.Data.Dtos;
using DI.Data.Entities;
using DI.Framework.DependencyInjection;
using DI.System.Data.Dtos;
using DI.System.Data.Entities;
using DI.System.Repositories;

namespace DI.System.Services
{    
    /// <summary>
    ///  订单明细表 Service
    ///  author di.net
    ///  date   2025-01-24 13:57:34
    /// </summary>
    public class CmsOrderDetailService : BaseService<CmsOrderDetail, CmsOrderDetailDto>, ITransient
    {
        private readonly ILogger<CmsOrderDetailService> _logger;
        private readonly CmsOrderDetailRepository _cmsOrderDetailRepository;

        public CmsOrderDetailService(ILogger<CmsOrderDetailService> logger,
            CmsOrderDetailRepository cmsOrderDetailRepository)
        {
            BaseRepo = cmsOrderDetailRepository;

            _logger = logger;
            _cmsOrderDetailRepository = cmsOrderDetailRepository;
        }

        /// <summary>
        /// 查询 订单明细表 详情
        /// </summary>
        public async Task<CmsOrderDetail> GetAsync(long id)
        {
            var entity = await base.FirstOrDefaultAsync(e => e.Id == id);
            return entity;
        }

        /// <summary>
        /// 查询 订单明细表 详情
        /// </summary>
        public async Task<CmsOrderDetailDto> GetDtoAsync(long id)
        {
            var entity = await base.FirstOrDefaultAsync(e => e.Id == id);
            var dto = entity.Adapt<CmsOrderDetailDto>();
            // TODO 填充关联表数据
            return dto;
        }
    }
}