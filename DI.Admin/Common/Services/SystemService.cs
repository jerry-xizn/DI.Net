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
            return $"欢迎使用{DiApp.DiConfig.Name}后台管理框架，当前版本：v{DiApp.DiConfig.Version}，请通过前端地址访问。";
        }
    }
}