local status, gitsings = pcall(require, 'gitsings')
if (not status) then return end

gitsings.setup {}
