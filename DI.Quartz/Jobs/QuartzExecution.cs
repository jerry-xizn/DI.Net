using Quartz;
using DI.Quartz.Dtos;
using DI.Quartz.Entities;
using DI.Quartz.Utils;

namespace DI.Quartz.Jobs
{
    public class QuartzExecution : AbstractQuartzJob
    {
        protected override void DoExecute(IJobExecutionContext context, SysJobDto sysJob)
        {
            JobInvokeUtils.InvokeMethod(sysJob);
        }
    }
}
