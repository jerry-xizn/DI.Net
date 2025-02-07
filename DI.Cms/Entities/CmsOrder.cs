using SqlSugar;
using System;
using System.Collections.Generic;
using DI.Data.Entities;
using DI.System.Data.Entities;

namespace DI.Cms.Data.Entities
{
    /// <summary>
    ///  订单表 对象 cms_order
    ///  author di.net
    ///  date   2025-01-24 13:56:00
    /// </summary>
    [SugarTable("cms_order", "订单表")]
    public class CmsOrder : BaseEntity
    {
        /// <summary>
        /// 订单ID (id)
        /// </summary>
        [SugarColumn(ColumnName = "id", ColumnDescription = "订单ID", IsPrimaryKey = true)]
        public long Id { get; set; }

        /// <summary>
        /// 客户名称 (customer_name)
        /// </summary>
        [SugarColumn(ColumnName = "customer_name", ColumnDescription = "客户名称")]
        public string? CustomerName { get; set; }

        /// <summary>
        /// 总货品数 (total_item_count)
        /// </summary>
        [SugarColumn(ColumnName = "total_item_count", ColumnDescription = "总货品数")]
        public int? TotalItemCount { get; set; }

        /// <summary>
        /// 部门代码 (dept_id)
        /// </summary>
        [SugarColumn(ColumnName = "dept_id", ColumnDescription = "部门代码")]
        public long? DeptId { get; set; }

        /// <summary>
        /// 组织代码 (org_id)
        /// </summary>
        [SugarColumn(ColumnName = "org_id", ColumnDescription = "组织代码")]
        public long? OrgId { get; set; }

        /// <summary>
        /// 行版本号 (record_version)
        /// </summary>
        [SugarColumn(ColumnName = "record_version", ColumnDescription = "行版本号")]
        public long? RecordVersion { get; set; }

        /// <summary>
        /// 订单编号 (order_no)
        /// </summary>
        [SugarColumn(ColumnName = "order_no", ColumnDescription = "订单编号")]
        public string? OrderNo { get; set; }

        /// <summary>
        /// 订单状态 (order_status)
        /// </summary>
        [SugarColumn(ColumnName = "order_status", ColumnDescription = "订单状态")]
        public int? OrderStatus { get; set; }

        /// <summary>
        /// 总金额 (total_amount)
        /// </summary>
        [SugarColumn(ColumnName = "total_amount", ColumnDescription = "总金额")]
        public string? TotalAmount { get; set; }

        /// <summary>
        /// 应用代码 (app_id)
        /// </summary>
        [SugarColumn(ColumnName = "app_id", ColumnDescription = "应用代码")]
        public long? AppId { get; set; }

        /// <summary>
        /// 客户手机号 (customer_phone)
        /// </summary>
        [SugarColumn(ColumnName = "customer_phone", ColumnDescription = "客户手机号")]
        public string? CustomerPhone { get; set; }

        /// <summary>
        /// 客户地址 (customer_address)
        /// </summary>
        [SugarColumn(ColumnName = "customer_address", ColumnDescription = "客户地址")]
        public string? CustomerAddress { get; set; }

    }
}