using System.Collections.Generic;
using DI.Data.Dtos;

namespace DI.Cms.Data.Dtos
{
    /// <summary>
    ///  新闻管理 对象 cms_news
    ///  author di.net
    ///  date   2025-01-21 15:06:29
    /// </summary>
    public class CmsNewsDto : BaseDto
    {
        /// <summary>
        /// 新闻ID
        /// </summary>
        public long NewsId { get; set; }

        /// <summary>
        /// 新闻标题
        /// </summary>
        public string NewsTitle { get; set; }

        /// <summary>
        /// 新闻作者
        /// </summary>
        public string? NewsAuthor { get; set; }

        /// <summary>
        /// 新闻内容
        /// </summary>
        public string? NewsContent { get; set; }

        /// <summary>
        /// 新闻摘要
        /// </summary>
        public string? NewsSummary { get; set; }

        /// <summary>
        /// 新闻状态
        /// </summary>
        public string? Status { get; set; }

        /// <summary>
        /// 浏览量
        /// </summary>
        public int? VisitCount { get; set; }

        /// <summary>
        /// 挣值
        /// </summary>
        public string? RewardAmount { get; set; }

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
