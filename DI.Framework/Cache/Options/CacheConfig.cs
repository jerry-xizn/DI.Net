using DI.Framework.Cache.Enums;
using DI.Framework.Cache.Options;

namespace DI.Framework.Cache.Redis;

public class CacheConfig
{
    public CacheType CacheType { get; set; }
    
    public RedisConfig? RedisConfig { get; set; }
}
