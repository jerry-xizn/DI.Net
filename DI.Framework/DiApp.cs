using DI.Framework.Configs;

namespace DI.Framework
{
    public static class DiApp
    {
        public static DIConfig DiConfig = App.GetConfig<DIConfig>("DIConfig");
        public static UserConfig UserConfig = App.GetConfig<UserConfig>("UserConfig");
    }
}
