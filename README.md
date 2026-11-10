# FiveM Job Selector Resource

Civic Job Selector is a configurable FiveM job selector resource. Players can view available jobs through a chat-based menu, choose a job by number, or use the job center marker in-game. Selected jobs are stored in server memory and replicated through the player state bag.

## Install

1. Place the resource folder in your server’s resources directory.
2. Add `ensure civic_job_selector` to your server configuration, using the resource folder’s actual name.
3. Edit `config.lua` to configure the job list, command, job center location, marker, and blip.
4. Restart the server or start the resource.

## Use

1. Run `/jobs` or approach the job center marker and press `E`.
2. Find the desired job’s number in the chat list.
3. Run `/setjob <number>` to select it.
4. Other server resources can read the player’s current job from the `job` state bag or use the `GetPlayerJob` export.

---

More FiveM resource projects by EnderDevelopment: https://github.com/EnderDevelopment

Project page: https://dash.enderdevelopment.com/community/1214a931-aaa2-481e-b85d-c0cc739ea7ae?utm_source=github&utm_medium=readme&utm_campaign=auto_publish&utm_content=1214a931-aaa2-481e-b85d-c0cc739ea7ae
