using Microsoft.Extensions.Logging;
using DI.Common.Enums;
using DI.Framework;
using DI.Framework.Extensions;
using DI.Framework.Utils;
using DI.Data.Dtos;
using DI.Cms.Services;
using DI.Cms.Data.Dtos;
using DI.Common.Utils;

namespace DI.Cms.Controllers
{
    /// <summary>
    /// 文章
    /// </summary>
    [ApiDescriptionSettings("cms")]
    [Route("cms/article")]
    public class CmsArticleController : ControllerBase
    {
        private readonly ILogger<CmsArticleController> _logger;
        private readonly CmsArticleService _cmsArticleService;
                
        public CmsArticleController(ILogger<CmsArticleController> logger,
            CmsArticleService cmsArticleService)
        {
            _logger = logger;
            _cmsArticleService = cmsArticleService;
        }

        /// <summary>
        /// 查询文章列表
        /// </summary>
        [HttpGet("list")]
        [AppAuthorize("cms:article:list")]
        public async Task<SqlSugarPagedList<CmsArticleDto>> GetCmsArticlePagedList([FromQuery] CmsArticleDto dto)
        {
           return await _cmsArticleService.GetDtoPagedListAsync(dto);
        }

        /// <summary>
        /// 获取 文章 详细信息
        /// </summary>
        [HttpGet("")]
        [HttpGet("{id}")]
        [AppAuthorize("cms:article:query")]
        public async Task<AjaxResult> Get(int id)
        {
            var data = await _cmsArticleService.GetDtoAsync(id);
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 新增 文章
        /// </summary>
        [HttpPost("")]
        [AppAuthorize("cms:article:add")]
        [TypeFilter(typeof(DI.Framework.DataValidation.DataValidationFilter))]
        [DI.System.Log(Title = "文章", BusinessType = BusinessType.INSERT)]
        public async Task<AjaxResult> Add([FromBody] CmsArticleDto dto)
        {
            var data = await _cmsArticleService.InsertAsync(dto);
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 修改 文章
        /// </summary>
        [HttpPut("")]
        [AppAuthorize("cms:article:edit")]
        [TypeFilter(typeof(DI.Framework.DataValidation.DataValidationFilter))]
        [DI.System.Log(Title = "文章", BusinessType = BusinessType.UPDATE)]
        public async Task<AjaxResult> Edit([FromBody] CmsArticleDto dto)
        {
            var data = await _cmsArticleService.UpdateAsync(dto);
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 删除 文章
        /// </summary>
        [HttpDelete("{ids}")]
        [AppAuthorize("cms:article:remove")]
        [DI.System.Log(Title = "文章", BusinessType = BusinessType.DELETE)]
        public async Task<AjaxResult> Remove(string ids)
        {
            var idList = ids.SplitToList<long>();
            var data = await _cmsArticleService.DeleteAsync(idList);
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 导入 文章
        /// </summary>
        [HttpPost("import")]
        [AppAuthorize("cms:article:import")]
        [DI.System.Log(Title = "文章", BusinessType = BusinessType.IMPORT)]
        public async Task Import([Required] IFormFile file)
        {
            var stream = new MemoryStream();
            file.CopyTo(stream);
            var list = await ExcelUtils.ImportAsync<CmsArticleDto>(stream);
            await _cmsArticleService.ImportDtoBatchAsync(list);
        }

        /// <summary>
        /// 导出 文章
        /// </summary>
        [HttpPost("export")]
        [AppAuthorize("cms:article:export")]
        [DI.System.Log(Title = "文章", BusinessType = BusinessType.EXPORT)]
        public async Task Export(CmsArticleDto dto)
        {
            var list = await _cmsArticleService.GetDtoListAsync(dto);
            await ExcelUtils.ExportAsync(App.HttpContext.Response, list);
        }
    }
}