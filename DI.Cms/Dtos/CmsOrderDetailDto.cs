using System.Collections.Generic;
using DI.Data.Dtos;

namespace DI.System.Data.Dtos
{
    /// <summary>
    ///  订单明细表 对象 cms_order_detail
    ///  author di.net
    ///  date   2025-01-24 13:57:34
    /// </summary>
    public class CmsOrderDetailDto : BaseDto
    {
        /// <summary>
        /// 订单明细ID
        /// </summary>
        public long Id { get; set; }
                
        /// <summary>
        /// 订单ID
        /// </summary>
        public long? OrderId { get; set; }
                
        /// <summary>
        /// 明细行号
        /// </summary>
        public int? LineNo { get; set; }
                
        /// <summary>
        /// 货品代码
        /// </summary>
        public string? ItemId { get; set; }
                
        /// <summary>
        /// 货品名称
        /// </summary>
        public int? ItemName { get; set; }
                
        /// <summary>
        /// 货品数量
        /// </summary>
        public int? ItemQty { get; set; }
                
        /// <summary>
        /// 货品单价
        /// </summary>
        public string? ItemPrice { get; set; }
                
        /// <summary>
        /// 货品总金额
        /// </summary>
        public string? ItemAmount { get; set; }
                
        /// <summary>
        /// 明细行状态
        /// </summary>
        public int? OrderDetailStatus { get; set; }
                
        /// <summary>
        /// 部门代码
        /// </summary>
        public long? DeptId { get; set; }
                
        /// <summary>
        /// 组织代码
        /// </summary>
        public long? OrgId { get; set; }
                
        /// <summary>
        /// 应用代码
        /// </summary>
        public long? AppId { get; set; }
                
        /// <summary>
        /// 行版本号
        /// </summary>
        public long? RecordVersion { get; set; }
                
    }
}
