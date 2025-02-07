using Microsoft.Extensions.Logging;
using DI.Common.Enums;
using DI.Framework;
using DI.Framework.Extensions;
using DI.Framework.Utils;
using DI.Data.Dtos;
using DI.System.Data.Dtos;
using DI.System.Services;
using DI.Common.Utils;

namespace DI.System.Controllers
{
    /// <summary>
    /// 订单明细表
    /// </summary>
    [ApiDescriptionSettings("cms")]
    [Route("cms/orderdetail")]
    public class CmsOrderDetailController : ControllerBase
    {
        private readonly ILogger<CmsOrderDetailController> _logger;
        private readonly CmsOrderDetailService _cmsOrderDetailService;
                
        public CmsOrderDetailController(ILogger<CmsOrderDetailController> logger,
            CmsOrderDetailService cmsOrderDetailService)
        {
            _logger = logger;
            _cmsOrderDetailService = cmsOrderDetailService;
        }

        /// <summary>
        /// 查询订单明细表列表
        /// </summary>
        [HttpGet("list")]
        [AppAuthorize("cms:orderdetail:list")]
        public async Task<SqlSugarPagedList<CmsOrderDetailDto>> GetCmsOrderDetailPagedList([FromQuery] CmsOrderDetailDto dto)
        {
           return await _cmsOrderDetailService.GetDtoPagedListAsync(dto);
        }

        /// <summary>
        /// 获取 订单明细表 详细信息
        /// </summary>
        [HttpGet("")]
        [HttpGet("{id}")]
        [AppAuthorize("cms:orderdetail:query")]
        public async Task<AjaxResult> Get(long id)
        {
            var data = await _cmsOrderDetailService.GetDtoAsync(id);
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 新增 订单明细表
        /// </summary>
        [HttpPost("")]
        [AppAuthorize("cms:orderdetail:add")]
        [TypeFilter(typeof(DI.Framework.DataValidation.DataValidationFilter))]
        [DI.System.Log(Title = "订单明细表", BusinessType = BusinessType.INSERT)]
        public async Task<AjaxResult> Add([FromBody] CmsOrderDetailDto dto)
        {
            var data = await _cmsOrderDetailService.InsertAsync(dto);
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 修改 订单明细表
        /// </summary>
        [HttpPut("")]
        [AppAuthorize("cms:orderdetail:edit")]
        [TypeFilter(typeof(DI.Framework.DataValidation.DataValidationFilter))]
        [DI.System.Log(Title = "订单明细表", BusinessType = BusinessType.UPDATE)]
        public async Task<AjaxResult> Edit([FromBody] CmsOrderDetailDto dto)
        {
            var data = await _cmsOrderDetailService.UpdateAsync(dto);
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 删除 订单明细表
        /// </summary>
        [HttpDelete("{ids}")]
        [AppAuthorize("cms:orderdetail:remove")]
        [DI.System.Log(Title = "订单明细表", BusinessType = BusinessType.DELETE)]
        public async Task<AjaxResult> Remove(string ids)
        {
            var idList = ids.SplitToList<long>();
            var data = await _cmsOrderDetailService.DeleteAsync(idList);
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 导入 订单明细表
        /// </summary>
        [HttpPost("import")]
        [AppAuthorize("cms:orderdetail:import")]
        [DI.System.Log(Title = "订单明细表", BusinessType = BusinessType.IMPORT)]
        public async Task Import([Required] IFormFile file)
        {
            var stream = new MemoryStream();
            file.CopyTo(stream);
            var list = await ExcelUtils.ImportAsync<CmsOrderDetailDto>(stream);
            await _cmsOrderDetailService.ImportDtoBatchAsync(list);
        }

        /// <summary>
        /// 导出 订单明细表
        /// </summary>
        [HttpPost("export")]
        [AppAuthorize("cms:orderdetail:export")]
        [DI.System.Log(Title = "订单明细表", BusinessType = BusinessType.EXPORT)]
        public async Task Export(CmsOrderDetailDto dto)
        {
            var list = await _cmsOrderDetailService.GetDtoListAsync(dto);
            await ExcelUtils.ExportAsync(App.HttpContext.Response, list);
        }
    }
}