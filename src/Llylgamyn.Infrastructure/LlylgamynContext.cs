using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Llylgamyn.Infrastructure.Identity;

namespace Llylgamyn.Infrastructure
{
    public class LlylgamynContext : IdentityDbContext<User>
    {
        public LlylgamynContext(DbContextOptions<LlylgamynContext> options)
            : base(options)
        {
        }
    }
}
