using Microsoft.AspNetCore.RateLimiting;
using Microsoft.Extensions.Logging;
using DI.Data.Node.Dtos;
using DI.Framework.RateLimit;

namespace DI.Admin
{
    /// <summary>
    /// 示例接口
    /// </summary>
    [ApiDescriptionSettings("Sample")]
    public class SampleController : ControllerBase
    {
        private readonly ILogger<SampleController> _logger;

        private readonly DI.Admin.SystemService _systemService;
        private readonly DI.System.Node.Services.SysUserService _nodeSysUserService;

        public SampleController(ILogger<SampleController> logger, SystemService systemService, 
            System.Node.Services.SysUserService slaveSysUserService)
        {
            _logger = logger;
            _systemService = systemService;
            _nodeSysUserService = slaveSysUserService;
        }

        /// <summary>
        /// 从库(slave) 用户查询
        /// 表 SysUser 的实体类上 添加特性 [Tenant(DataConstants.Slave)]
        /// </summary>
        [HttpGet("{id}")]
        public async Task<NodeSysUserDto> Get(long? id)
        {
            return await _nodeSysUserService.GetAsync(id);
        }

        /// <summary>
        /// 从库(slave) 用户查询
        /// 表 SysUser 的实体类上 添加特性 [Tenant(DataConstants.Slave)]
        /// </summary>
        [HttpGet("getWithPerminAndRole/{id}")]
        [AppAuthorize("system:dept:query")]
        [AppRoleAuthorize("admin")]
        public async Task<NodeSysUserDto> GetWithPerminAndRole(long? id)
        {
            return await _nodeSysUserService.GetAsync(id);
        }

        /// <summary>
        /// 限流
        /// 添加特性 [EnableRateLimiting(LimitType.Default)]
        /// </summary>
        [HttpGet("rateLimit")]
        [EnableRateLimiting(LimitType.Default)]
        public string RateLimit()
        {
            //return Guid.NewGuid().ToString();
            return "rateLimit";
        }

        /// <summary>
        /// IP限流
        /// 添加特性 [EnableRateLimiting(LimitType.IP)]
        /// </summary>
        [HttpGet("ipRateLimit")]
        [EnableRateLimiting(LimitType.IP)]
        public string IpRateLimit()
        {
            //return Guid.NewGuid().ToString();
            return "ipRateLimit";
        }
    }
}