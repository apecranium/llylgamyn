using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

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
