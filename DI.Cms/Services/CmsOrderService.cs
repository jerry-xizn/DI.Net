using Mapster;
using Microsoft.Extensions.Logging;
using DI.Data;
using DI.Data.Dtos;
using DI.Data.Entities;
using DI.Framework.DependencyInjection;
using DI.Cms.Data.Dtos;
using DI.Cms.Data.Entities;
using DI.Cms.Repositories;
using DI.System.Repositories;

namespace DI.Cms.Services
{
    /// <summary>
    ///  订单表 Service
    ///  author di.net
    ///  date   2025-01-24 14:01:14
    /// </summary>
    public class CmsOrderService : BaseService<CmsOrder, CmsOrderDto>, ITransient
    {
        private readonly ILogger<CmsOrderService> _logger;
        private readonly CmsOrderRepository _cmsOrderRepository;
        private readonly CmsOrderDetailRepository _cmsOrderDetailRepository;

        public CmsOrderService(ILogger<CmsOrderService> logger,
            CmsOrderRepository cmsOrderRepository,
            CmsOrderDetailRepository cmsOrderDetailRepository)
        {
            BaseRepo = cmsOrderRepository;

            _logger = logger;
            _cmsOrderRepository = cmsOrderRepository;
            _cmsOrderDetailRepository = cmsOrderDetailRepository;
        }

        /// <summary>
        /// 查询 订单表 详情
        /// </summary>
        public async Task<CmsOrder> GetAsync(long id)
        {
            var entity = await base.FirstOrDefaultAsync(e => e.Id == id);
            return entity;
        }

        /// <summary>
        /// 查询 订单表 详情
        /// </summary>
        public async Task<CmsOrderDto> GetDtoAsync(long id)
        {
            var entity = await base.FirstOrDefaultAsync(e => e.Id == id);
            var dto = entity.Adapt<CmsOrderDto>();
            // TODO 填充关联表数据
            return dto;
        }

        /// <summary>
        /// 删除业务对象
        /// </summary>
        /// <param name="ids">需要删除的数据ID</param>
        public int DeleteByIds(List<long> ids)
        {
            int result = 0;
            if (!ids.IsEmpty())
            {
                // 开启事务
                try
                {
                    using (var tran = _cmsOrderRepository.Repo.Ado.UseTran())
                    {
                        // 删除明细
                        _cmsOrderDetailRepository.Delete(d => ids.Contains(d.OrderId ?? 0));

                        //throw new Exception($"exception occer {DateTime.Now.ToString()} ");

                        // 删除订单
                        result = _cmsOrderRepository.DeleteByKeys(ids);

                        tran.CommitTran();
                    }
                }
                catch (Exception ex)
                {   
                    throw ex;
                }
            }
            return result;
        }
    }
}