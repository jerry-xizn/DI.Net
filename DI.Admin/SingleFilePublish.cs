using DI.Framework;
using System.Reflection;

namespace DI.Admin
{
    public class SingleFilePublish : ISingleFilePublish
    {
        public Assembly[] IncludeAssemblies()
        {
            return Array.Empty<Assembly>();
        }

        public string[] IncludeAssemblyNames()
        {
            return new[]
            {
                "DI.Framework",
                "DI.Common",
                "DI.Data",
                "DI.Admin",
                "DI.Generator",
                "DI.System",
                "DI.Cms"
            };
        }
    }
}