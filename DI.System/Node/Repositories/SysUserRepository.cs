using DI.Data.Node.Dtos;
using DI.Data.Node.Entities;

namespace DI.System.Node.Repositories;

/// <summary>
///  用户信息表 Repository
///  author di
///  date   2023-08-21 14:40:20
/// </summary>
public class SysUserRepository : BaseRepository<NodeSysUser, NodeSysUserDto>
{
    public SysUserRepository(ISqlSugarRepository<NodeSysUser> sqlSugarRepository)
    {
        Repo = sqlSugarRepository;
    }

    public override ISugarQueryable<NodeSysUser> Queryable(NodeSysUserDto dto)
    {
        return Repo.AsQueryable()
        //.Includes(t => t.SubTable)
        //.WhereIF(dto.Id > 0, (t) => t.Id == dto.Id)
        ;
    }

    public override ISugarQueryable<NodeSysUserDto> DtoQueryable(NodeSysUserDto dto)
    {
        return Repo.AsQueryable()
            //.LeftJoin<SubTable>((t, s) => t.Id == s.Id)
            //.WhereIF(dto.Id > 0, (t) => t.Id == dto.Id)
            .Select((t) => new NodeSysUserDto
            {
                CreateBy = t.CreateBy,
                CreateTime = t.CreateTime,
                UpdateBy = t.UpdateBy,
                UpdateTime = t.UpdateTime,

            });
    }
}