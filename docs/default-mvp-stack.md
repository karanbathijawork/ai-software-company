# Default MVP Stack Recommendation

For most early-stage web products, the simplest default stack is:

- Frontend: React with Vite
- Backend: Node.js with Express or Next.js API routes
- Database: PostgreSQL or SQLite for lightweight projects
- Styling: Tailwind CSS
- Authentication: Clerk or Supabase Auth
- Deployment: Vercel for frontend and Supabase or Railway for backend/data
- Testing: Vitest and Playwright

## Recommended default for speed

If you want the fastest path to a working MVP:

- React + Vite
- Tailwind CSS
- Supabase for auth and data
- Vercel for deployment

This combination is easy to set up, fast to iterate on, and suitable for many product ideas.

## When to choose something else

Use a different stack if:
- the product is heavily backend-heavy and needs a more custom architecture
- the team already has strong constraints or preferences
- the product requires advanced real-time collaboration or complex data processing

## Rule of thumb

Choose the simplest stack that can deliver the core experience quickly and safely.
