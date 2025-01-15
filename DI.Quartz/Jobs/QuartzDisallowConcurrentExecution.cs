using Quartz;
using DI.Quartz.Utils;

namespace DI.Quartz.Jobs
{
    [DisallowConcurrentExecution]
    public class QuartzDisallowConcurrentExecution : AbstractQuartzJob
    {
        protected override void DoExecute(IJobExecutionContext context, SysJobDto sysJob)
        {
            try
            {
                JobInvokeUtils.InvokeMethod(sysJob);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
        }
    }
}
