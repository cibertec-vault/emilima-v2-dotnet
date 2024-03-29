﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using EmilimaV2Web.Models;
using Microsoft.AspNetCore.Authorization;

namespace EmilimaV2Web.Controllers
{
    [Authorize(Roles = "Administrador")]
    public class UsersController : Controller
    {
        private readonly EmilimaContext _context;

        public UsersController(EmilimaContext context)
        {
            _context = context;
        }

        // GET: Users
        public async Task<IActionResult> Index()
        {
            var emilimaContext = _context.Users.Include(u => u.Photo).Include(u => u.Position).Include(u => u.Role);
            return View(await emilimaContext.ToListAsync());
        }

        // GET: Users/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.Users == null)
            {
                return NotFound();
            }

            var user = await _context.Users
                .Include(u => u.Photo)
                .Include(u => u.Position)
                .Include(u => u.Role)
                .FirstOrDefaultAsync(m => m.Username == id);
            if (user == null)
            {
                return NotFound();
            }

            return View(user);
        }

        // GET: Users/Create
        public IActionResult Create()
        {
            ViewData["PhotoId"] = new SelectList(_context.Files, "Id", "Id");
            ViewData["PositionId"] = new SelectList(_context.UserPositions, "Id", "Name");
            ViewData["RoleId"] = new SelectList(_context.UserRoles, "Id", "Name");
            return View();
        }

        // POST: Users/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Username,Password,Email,RoleId,PhotoId,PositionId")] User user)
        {
            if (!ModelState.IsValid)
            {
                _context.Add(user);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["PhotoId"] = new SelectList(_context.Files, "Id", "Id", user.PhotoId);
            ViewData["PositionId"] = new SelectList(_context.UserPositions, "Id", "Id", user.PositionId);
            ViewData["RoleId"] = new SelectList(_context.UserRoles, "Id", "Id", user.RoleId);
            return View(user);
        }

        // GET: Users/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.Users == null)
            {
                return NotFound();
            }

            var user = await _context.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }
            ViewData["PhotoId"] = new SelectList(_context.Files, "Id", "Id", user.PhotoId);
            ViewData["PositionId"] = new SelectList(_context.UserPositions, "Id", "Name", user.PositionId);
            ViewData["RoleId"] = new SelectList(_context.UserRoles, "Id", "Name", user.RoleId);
            return View(user);
        }

        // POST: Users/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Username,Password,Email,RoleId,PhotoId,PositionId")] User user)
        {
            if (id != user.Username)
            {
                return NotFound();
            }

            if (!ModelState.IsValid)
            {
                try
                {
                    _context.Update(user);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!UserExists(user.Username))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["PhotoId"] = new SelectList(_context.Files, "Id", "Id", user.PhotoId);
            ViewData["PositionId"] = new SelectList(_context.UserPositions, "Id", "Id", user.PositionId);
            ViewData["RoleId"] = new SelectList(_context.UserRoles, "Id", "Id", user.RoleId);
            return View(user);
        }

        // GET: Users/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.Users == null)
            {
                return NotFound();
            }

            var user = await _context.Users
                .Include(u => u.Photo)
                .Include(u => u.Position)
                .Include(u => u.Role)
                .FirstOrDefaultAsync(m => m.Username == id);
            if (user == null)
            {
                return NotFound();
            }

            return View(user);
        }

        // POST: Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.Users == null)
            {
                return Problem("Entity set 'EmilimaContext.Users'  is null.");
            }
            var user = await _context.Users.FindAsync(id);
            if (user != null)
            {
                _context.Users.Remove(user);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool UserExists(string id)
        {
          return _context.Users.Any(e => e.Username == id);
        }
    }
}
