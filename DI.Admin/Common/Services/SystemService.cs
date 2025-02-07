using DI.Framework;

namespace DI.Admin
{
    public class SystemService : ITransient
    {
        //private readonly ISqlSugarRepository _repository;

        public SystemService()
        {
            //_repository = repository;
        }

        public string GetDescription()
        {
            return $"{DiApp.DiConfig.Name}管理系统，当前版本：v{DiApp.DiConfig.Version}，请通过前端地址登录。";
        }
    }
}