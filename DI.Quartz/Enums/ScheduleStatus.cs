using System.ComponentModel;

namespace DI.Quartz.Enums
{
    public enum ScheduleStatus
    {
        [Description("正常")]
        NORMAL,
        [Description("暂停")]
        PAUSE
    }
}
