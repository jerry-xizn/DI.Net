using Microsoft.Extensions.DependencyInjection;
using RazorEngineCore;
using DI.Generator.Options;

namespace DI.Generator;

[AppStartup(300)]
public sealed class Startup : AppStartup
{
    public void ConfigureServices(IServiceCollection services)
    {
        // 配置热重载
        services.AddConfigurableOptions<GenOptions>();

        // RazorEngine
        services.AddScoped<IRazorEngine, RazorEngine>();
    }
}