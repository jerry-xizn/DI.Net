using SqlSugar;
using System;
using System.Collections.Generic;
using DI.Data.Entities;

namespace DI.Cms.Data.Entities
{
    /// <summary>
    ///  新闻管理 对象 cms_news
    ///  author di.net
    ///  date   2025-01-21 15:06:29
    /// </summary>
    [SugarTable("cms_news", "新闻表")]
    public class CmsNews : UserBaseEntity
    {
        /// <summary>
        /// 新闻ID (news_id)
        /// </summary>
        [SugarColumn(ColumnName = "news_id", ColumnDescription = "新闻ID", IsPrimaryKey = true)]
        public long NewsId { get; set; }

        /// <summary>
        /// 新闻标题 (news_title)
        /// </summary>
        [SugarColumn(ColumnName = "news_title", ColumnDescription = "新闻标题")]
        public string NewsTitle { get; set; }

        /// <summary>
        /// 新闻作者 (news_author)
        /// </summary>
        [SugarColumn(ColumnName = "news_author", ColumnDescription = "新闻作者")]
        public string? NewsAuthor { get; set; }

        /// <summary>
        /// 新闻内容 (news_content)
        /// </summary>
        [SugarColumn(ColumnName = "news_content", ColumnDescription = "新闻内容")]
        public string? NewsContent { get; set; }

        /// <summary>
        /// 新闻摘要 (news_summary)
        /// </summary>
        [SugarColumn(ColumnName = "news_summary", ColumnDescription = "新闻摘要")]
        public string? NewsSummary { get; set; }

        /// <summary>
        /// 新闻状态 (status)
        /// </summary>
        [SugarColumn(ColumnName = "status", ColumnDescription = "新闻状态")]
        public string? Status { get; set; }

        /// <summary>
        /// 浏览量 (visit_count)
        /// </summary>
        [SugarColumn(ColumnName = "visit_count", ColumnDescription = "浏览量")]
        public int? VisitCount { get; set; }

        /// <summary>
        /// 挣值 (reward_amount)
        /// </summary>
        [SugarColumn(ColumnName = "reward_amount", ColumnDescription = "挣值")]
        public string? RewardAmount { get; set; }

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
        /// 应用代码 (app_id)
        /// </summary>
        [SugarColumn(ColumnName = "app_id", ColumnDescription = "应用代码")]
        public long? AppId { get; set; }

        /// <summary>
        /// 行版本号 (record_version)
        /// </summary>
        [SugarColumn(ColumnName = "record_version", ColumnDescription = "行版本号", IsEnableUpdateVersionValidation = true)]
        public long? RecordVersion { get; set; }

    }
}
