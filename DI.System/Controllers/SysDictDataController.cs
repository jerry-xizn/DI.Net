using DI.Common.Enums;
using DI.Common.Utils;
using DI.Data.Dtos;
using DI.Data.Entities;
using DI.Framework;
using DI.System.Services;

namespace DI.System.Controllers
{
    /// <summary>
    /// 字典数据表
    /// </summary>
    [ApiDescriptionSettings("System")]
    [Route("system/dict/data")]
    public class SysDictDataController : ControllerBase
    {
        private readonly ILogger<SysDictDataController> _logger;
        private readonly SysDictDataService _sysDictDataService;
        private readonly SysDictTypeService _sysDictTypeService;

        public SysDictDataController(ILogger<SysDictDataController> logger,
            SysDictDataService sysDictDataService,
            SysDictTypeService sysDictTypeService)
        {
            _logger = logger;
            _sysDictDataService = sysDictDataService;
            _sysDictTypeService = sysDictTypeService;
        }

        /// <summary>
        /// 查询字典数据表列表
        /// </summary>
        [HttpGet("list")]
        [AppAuthorize("system:data:list")]
        public async Task<SqlSugarPagedList<SysDictDataDto>> GetSysDictDataList([FromQuery] SysDictDataDto dto)
        {
            return await _sysDictDataService.GetDtoPagedListAsync(dto);
        }

        /// <summary>
        /// 获取 字典数据表 详细信息
        /// </summary>
        [HttpGet("{dictCode}")]
        [AppAuthorize("system:data:query")]
        public async Task<AjaxResult> Get(long dictCode)
        {
            var data = await _sysDictDataService.GetAsync(dictCode);
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 根据字典类型查询字典数据信息
        /// </summary>
        [HttpGet("type/{dictType}")]
        public async Task<AjaxResult> GetListByDictType(string dictType)
        {
            List<SysDictData> data = await _sysDictTypeService.SelectDictDataByTypeAsync(dictType);
            if (data == null)
            {
                data = new List<SysDictData>();
            }
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 新增 字典数据表
        /// </summary>
        [HttpPost("")]
        [AppAuthorize("system:data:add")]
        [TypeFilter(typeof(DI.Framework.DataValidation.DataValidationFilter))]
        [Log(Title = "字典数据", BusinessType = BusinessType.INSERT)]
        public async Task<AjaxResult> Add([FromBody] SysDictDataDto dto)
        {
            var data = await _sysDictDataService.InsertDictDataAsync(dto);
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 修改 字典数据表
        /// </summary>
        [HttpPut("")]
        [AppAuthorize("system:data:edit")]
        [TypeFilter(typeof(DI.Framework.DataValidation.DataValidationFilter))]
        [Log(Title = "字典数据", BusinessType = BusinessType.UPDATE)]
        public async Task<AjaxResult> Edit([FromBody] SysDictDataDto dto)
        {
            var data = await _sysDictDataService.UpdateDictDataAsync(dto);
            return AjaxResult.Success(data);
        }

        /// <summary>
        /// 删除 字典数据表
        /// </summary>
        [HttpDelete("{dictCodes}")]
        [AppAuthorize("system:data:remove")]
        [Log(Title = "字典数据", BusinessType = BusinessType.DELETE)]
        public async Task<AjaxResult> Remove(long[] dictCodes)
        {
            await _sysDictDataService.DeleteDictDataByIdsAsync(dictCodes);
            return AjaxResult.Success();
        }

        /// <summary>
        /// 导出 字典数据表
        /// </summary>
        [HttpPost("export")]
        [AppAuthorize("system:data:export")]
        [Log(Title = "字典数据", BusinessType = BusinessType.EXPORT)]
        public async Task Export(SysDictDataDto dto)
        {
            var list = await _sysDictDataService.GetDtoListAsync(dto);
            await ExcelUtils.ExportAsync(App.HttpContext.Response, list);
        }
    }
}