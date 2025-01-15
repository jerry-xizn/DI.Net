using Microsoft.Extensions.Logging;
using DI.Common.Enums;
using DI.Framework;
using DI.Framework.Extensions;
using DI.Framework.Utils;
using DI.Data.Dtos;
using DI.Cms.Data.Dtos;
using DI.Cms.Services;
using DI.Common.Utils;

namespace DI.Cms.Controllers
{
    /// <summary>
    /// 新闻管理
    /// </summary>
    [ApiDescriptionSettings("news")]
    [Route("news/news")]
    public class CmsNewsController : ControllerBase
    {
        private readonly ILogger<CmsNewsController> _logger;
        private readonly CmsNewsService _cmsNewsService;
                
        public CmsNewsController(ILogger<CmsNewsController> logger,
            CmsNewsService cmsNewsService)
        {
            _logger = logger;
            _cmsNewsService = cmsNewsService;
        }

        /// <summary>
        /// 查询新闻管理列表
        /// </summary>
        [HttpGet("list")]
        [AppAuthorize("news:news:list")]
        public async Task<SqlSugarPagedList<CmsNewsDto>> GetCmsNewsPagedList([FromQuery] CmsNewsDto dto)
        {
           return await _cmsNewsService.GetDtoPagedListAsync(dto);
        }

        /// <summary>
        /// 获取 新闻管理 详细信息
        /// </summary>
        [HttpGet("")]
        [HttpGet("{id}")]
        [AppAuthorize("news:news:query")]
        public async Task<AjaxResult> Get(int id)
        {
            var data = await _cmsNewsService.GetDtoAsync(id);
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 新增 新闻管理
        /// </summary>
        [HttpPost("")]
        [AppAuthorize("news:news:add")]
        [TypeFilter(typeof(DI.Framework.DataValidation.DataValidationFilter))]
        [DI.System.Log(Title = "新闻管理", BusinessType = BusinessType.INSERT)]
        public async Task<AjaxResult> Add([FromBody] CmsNewsDto dto)
        {
            var data = await _cmsNewsService.InsertAsync(dto);
            return AjaxResult.Success(data);
        }

        [HttpPost("Check")]
        [AppAuthorize("news:news:add")]
        [TypeFilter(typeof(DI.Framework.DataValidation.DataValidationFilter))]
        [DI.System.Log(Title = "新闻管理", BusinessType = BusinessType.UPDATE)]
        public async Task<AjaxResult> Check([FromBody] CmsNewsDto dto)
        {
            var data = await _cmsNewsService.InsertAsync(dto);
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 修改 新闻管理
        /// </summary>
        [HttpPut("")]
        [AppAuthorize("news:news:edit")]
        [TypeFilter(typeof(DI.Framework.DataValidation.DataValidationFilter))]
        [DI.System.Log(Title = "新闻管理", BusinessType = BusinessType.UPDATE)]
        public async Task<AjaxResult> Edit([FromBody] CmsNewsDto dto)
        {
            var data = await _cmsNewsService.UpdateAsync(dto);
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 删除 新闻管理
        /// </summary>
        [HttpDelete("{ids}")]
        [AppAuthorize("news:news:remove")]
        [DI.System.Log(Title = "新闻管理", BusinessType = BusinessType.DELETE)]
        public async Task<AjaxResult> Remove(string ids)
        {
            var idList = ids.SplitToList<long>();
            var data = await _cmsNewsService.DeleteAsync(idList);
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 导入 新闻管理
        /// </summary>
        [HttpPost("import")]
        [AppAuthorize("news:news:import")]
        [DI.System.Log(Title = "新闻管理", BusinessType = BusinessType.IMPORT)]
        public async Task Import([Required] IFormFile file)
        {
            var stream = new MemoryStream();
            file.CopyTo(stream);
            var list = await ExcelUtils.ImportAsync<CmsNewsDto>(stream);
            await _cmsNewsService.ImportDtoBatchAsync(list);
        }

        /// <summary>
        /// 导出 新闻管理
        /// </summary>
        [HttpPost("export")]
        [AppAuthorize("news:news:export")]
        [DI.System.Log(Title = "新闻管理", BusinessType = BusinessType.EXPORT)]
        public async Task Export(CmsNewsDto dto)
        {
            var list = await _cmsNewsService.GetDtoListAsync(dto);
            await ExcelUtils.ExportAsync(App.HttpContext.Response, list);
        }
    }
}