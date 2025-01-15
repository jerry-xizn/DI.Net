using System.ComponentModel;

namespace DI.Common.Enums
{
    /// <summary>
    /// 操作状态
    /// </summary>
    public enum BusinessStatus
    {
        [Description("成功")]
        SUCCESS,

        [Description("失败")]
        FAIL,
    }

}
