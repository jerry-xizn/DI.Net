using System.Collections.Generic;
using DI.Data.Dtos;

namespace DI.Cms.Data.Dtos
{
    /// <summary>
    ///  订单表 对象 cms_order
    ///  author di.net
    ///  date   2025-01-24 14:01:14
    /// </summary>
    public class CmsOrderDto : BaseDto
    {
        /// <summary>
        /// 订单ID
        /// </summary>
        public long Id { get; set; }

        /// <summary>
        /// 订单编号
        /// </summary>
        public string? OrderNo { get; set; }

        /// <summary>
        /// 订单状态
        /// </summary>
        public int? OrderStatus { get; set; }

        /// <summary>
        /// 客户名称
        /// </summary>
        public string? CustomerName { get; set; }

        /// <summary>
        /// 应用代码
        /// </summary>
        public long? AppId { get; set; }

        /// <summary>
        /// 总货品数
        /// </summary>
        public int? TotalItemCount { get; set; }

        /// <summary>
        /// 总金额
        /// </summary>
        public string? TotalAmount { get; set; }

        /// <summary>
        /// 部门代码
        /// </summary>
        public long? DeptId { get; set; }

        /// <summary>
        /// 组织代码
        /// </summary>
        public long? OrgId { get; set; }

        /// <summary>
        /// 行版本号
        /// </summary>
        public long? RecordVersion { get; set; }

        /// <summary>
        /// 客户手机号
        /// </summary>
        public string? CustomerPhone { get; set; }

        /// <summary>
        /// 客户地址
        /// </summary>
        public string? CustomerAddress { get; set; }

    }
}