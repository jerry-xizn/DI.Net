using Microsoft.Extensions.Logging;
using DI.Common.Enums;
using DI.Framework;
using DI.Framework.Extensions;
using DI.Framework.Utils;
using DI.Data.Dtos;
using DI.Cms.Data.Dtos;
using DI.Cms.Services;
using DI.Common.Utils;
using DI.System.Services;
using DI.System.Data.Dtos;

namespace DI.Cms.Controllers
{
    /// <summary>
    /// 订单表
    /// </summary>
    [ApiDescriptionSettings("cms")]
    [Route("cms/order")]
    public class CmsOrderController : ControllerBase
    {
        private readonly ILogger<CmsOrderController> _logger;
        private readonly CmsOrderService _cmsOrderService;
        private readonly CmsOrderDetailService _cmsOrderDetailService;

        public CmsOrderController(ILogger<CmsOrderController> logger,
             CmsOrderService cmsOrderService,
             CmsOrderDetailService cmsOrderDetailService)
        {
            _logger = logger;
            _cmsOrderService = cmsOrderService;
            _cmsOrderDetailService = cmsOrderDetailService;
        }

        /// <summary>
        /// 查询订单表列表
        /// </summary>
        [HttpGet("list")]
        [AppAuthorize("cms:order:list")]
        public async Task<SqlSugarPagedList<CmsOrderDto>> GetCmsOrderPagedList([FromQuery] CmsOrderDto dto)
        {
            return await _cmsOrderService.GetDtoPagedListAsync(dto);
        }

        /// <summary>
        /// 获取 订单表 详细信息
        /// </summary>
        [HttpGet("")]
        [HttpGet("{id}")]
        [AppAuthorize("cms:order:query")]
        public async Task<AjaxResult> Get(long id)
        {
            var data = await _cmsOrderService.GetDtoAsync(id);
            return AjaxResult.Success(data);
        }

        [HttpGet("GetOrderWithDetail")]
        [AppAuthorize("cms:order:query")]
        public async Task<AjaxResult> GetOrderWithDetail(long id)
        {
            var data = await _cmsOrderService.GetDtoAsync(id);
            List<CmsOrderDetailDto> list = await _cmsOrderDetailService.GetDtoListAsync(new CmsOrderDetailDto { OrderId = id });
            Dictionary<string, object> map = new Dictionary<string, object>();
            map.Add("info", data);
            map.Add("rows", list);
            return AjaxResult.Success(map);
        }

        /// <summary>
        /// 新增 订单表
        /// </summary>
        [HttpPost("")]
        [AppAuthorize("cms:order:add")]
        [TypeFilter(typeof(DI.Framework.DataValidation.DataValidationFilter))]
        [DI.System.Log(Title = "订单表", BusinessType = BusinessType.INSERT)]
        public async Task<AjaxResult> Add([FromBody] CmsOrderDto dto)
        {
            dto.Id = SnowFlakeSingle.instance.NextId();
            var data = await _cmsOrderService.InsertAsync(dto);
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 修改 订单表
        /// </summary>
        [HttpPut("")]
        [AppAuthorize("cms:order:edit")]
        [TypeFilter(typeof(DI.Framework.DataValidation.DataValidationFilter))]
        [DI.System.Log(Title = "订单表", BusinessType = BusinessType.UPDATE)]
        public async Task<AjaxResult> Edit([FromBody] CmsOrderDto dto)
        {
            var data = await _cmsOrderService.UpdateAsync(dto);
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 删除 订单表
        /// </summary>
        [HttpDelete("{ids}")]
        [AppAuthorize("cms:order:remove")]
        [DI.System.Log(Title = "订单表", BusinessType = BusinessType.DELETE)]
        public async Task<AjaxResult> Remove(string ids)
        {
            var idList = ids.SplitToList<long>();
            var data = _cmsOrderService.DeleteByIds(idList); //await _cmsOrderService.DeleteAsync(idList);
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 导入 订单表
        /// </summary>
        [HttpPost("import")]
        [AppAuthorize("cms:order:import")]
        [DI.System.Log(Title = "订单表", BusinessType = BusinessType.IMPORT)]
        public async Task Import([Required] IFormFile file)
        {
            var stream = new MemoryStream();
            file.CopyTo(stream);
            var list = await ExcelUtils.ImportAsync<CmsOrderDto>(stream);
            await _cmsOrderService.ImportDtoBatchAsync(list);
        }

        /// <summary>
        /// 导出 订单表
        /// </summary>
        [HttpPost("export")]
        [AppAuthorize("cms:order:export")]
        [DI.System.Log(Title = "订单表", BusinessType = BusinessType.EXPORT)]
        public async Task Export(CmsOrderDto dto)
        {
            var list = await _cmsOrderService.GetDtoListAsync(dto);
            await ExcelUtils.ExportAsync(App.HttpContext.Response, list);
        }
    }
}