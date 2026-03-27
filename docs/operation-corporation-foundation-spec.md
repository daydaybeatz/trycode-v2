# Operation Corporation — Foundation Spec

## Completed Bulletins (This Pass)

- 1 High concept loop
- 4 Base + Field + Dispatch modes
- 5 Short/medium loop connections
- 7 Vision + LOS + sound + concealment
- 9 Enemy state machine basics
- 10 Procedural outpost templates + variables
- 11 Mission type/modifier/objective tables
- 12 Capture -> recruit processing
- 13 Departments (core impact values)
- 14 Research queue + unlock categories
- 16 Dispatch simulation outcomes
- 17 Resource economy (core currencies)
- 18 Heat/threat escalation
- 19 Extraction gate for rewards
- 22 Mission rank/scoring
- 23 Persistent save data
- 24 Data-driven defs (enemy/staff/mission)

---

A retro top-down stealth-action command game with base growth, dispatch operations, enemy capture/recruitment, R&D, and repeatable field infiltration.

Core inspiration: stealth sandbox gameplay, enemy outposts, nonlethal takedowns, extraction, staff management, gadget progression, and player-driven mission planning.

## 1) High Concept

Operation Corporation is a retro-style top-down tactical infiltration game where the player leads a growing private military/corporate covert unit.

### Loop

1. Prepare at base
2. Research or craft tools
3. Select field loadout and squad support
4. Infiltrate a hostile outpost
5. Use stealth, gadgets, and combat to neutralize or capture enemies
6. Extract staff/resources/intel
7. Expand the corporation through recruitment, upgrades, and dispatch missions

The game should feel large in content but built from modular, reusable systems.

## 2) Core Pillars

### 2.1 Stealth Sandbox

Player is strongest when unseen. Vision cones, sound, patrols, alarms, hiding, distractions, and nonlethal takedowns matter.

### 2.2 Repeating but Varied Operations

Missions are replayable through procedural outposts, patrol routes, weather/time modifiers, randomized side objectives, and shifting enemy loadouts.

### 2.3 Staff as Progression

Enemies defeated nonlethally can be extracted, recruited, assigned, fired, refined, or used for dispatch and R&D.

### 2.4 Base Growth

The player’s corporation grows by constructing departments, unlocking systems, and improving efficiency.

### 2.5 Retro but Systemic

Graphics are retro and readable, but mechanics are deep and interconnected.

## 3) Camera / Presentation / Style

- Perspective: top-down or slightly angled top-down, readable silhouettes.
- Visual style: retro military-industrial, strong alert readability, weather/time tinting.
- Tone: serious tactical with satirical corporate-war framing.

## 4) Main Game Modes

### 4.1 Base Management Mode

Manage staff, facilities, research, recruitment, loadouts, construction, dispatch, and mission selection.

Screens:
- Command Overview
- Staff Roster
- R&D
- Manufacturing
- Dispatch
- Intel Database
- Brig / Holding
- Unit Assignments
- Resource Inventory
- Mission Map

### 4.2 Field Operation Mode

Real-time top-down infiltration with procedural outposts, objectives, captures, and extraction.

### 4.3 Dispatch Mission Mode

Asynchronous-feeling simulations based on team composition, mission type, risk, and equipment.

## 5) Primary Gameplay Loop

### Short Loop

Deploy -> scout -> infiltrate -> neutralize/capture -> secure resources -> extract.

### Medium Loop

Return -> process captured staff -> allocate recruits -> research -> build departments -> dispatch.

### Long Loop

Expand corporation -> unlock regions -> face harder factions -> specialized teams -> elite staff -> strategic dominance.

## 6) Player Character Design

### 6.1 Core Actions

Move, crouch/slow-walk, sprint, aim/fire/reload, melee, nonlethal takedown, interrogate, body handling, gadgets, concealment interactions, and contextual world interactions.

### 6.2 Player Stats

HP, stamina, noise, visibility, extraction capacity, weapon handling, move speed, recovery, carry capacity.

### 6.3 Upgrade Categories

Stealth, mobility, combat, extraction, command support, recon.

## 7) Stealth Systems

### 7.1 Enemy Vision

Detection parameters per enemy: facing, cone, range, peripheral sensitivity, accumulation meter.

States:
1. Idle
2. Suspicious
3. Investigating
4. Confirmed Alert
5. Combat/Search
6. Stand-down / heightened patrol

### 7.2 Line of Sight

True obstruction checks with geometry and concealment systems.

### 7.3 Sound

Noise-emitting actions with enemy hearing reactions based on radius, alertness, role, and training.

### 7.4 Concealment

Grass, shadows, ditches, containers, and edge cover modify detection speed.

### 7.5 Bodies and Evidence

Evidence discovery should create emergent escalation.

## 8) Combat Systems

- Lethal is strongest now; nonlethal is strongest long-term.
- Weapon categories: pistols, SMGs, ARs, shotguns, snipers, tranq, stun, explosives, support.
- Damage types include ballistic, explosive, tranq buildup, stun, gas/sleep, and melee variants.
- Nonlethal states support capture/recruit loop.

## 9) Enemy AI

### Enemy Types

Rifle guard, scout, heavy, radio, sniper, shield, officer, camera op, medic, engineer, elite, plus optional handlers/controllers.

### AI State Machine

Idle, patrol, guard, converse, investigate, chase, cover, attack, call reinforcements, search, return, flee/panic, optional sleep/off-duty.

### Perception + Coordination

Enemies track last seen/heard positions, threat and awareness, and can coordinate alarms/sector searches/exit defense.

## 10) Outpost Generation

Use themed template families and hybrid generation:

- Hand-authored modules
- Rule-driven placement
- Random patrol/objective variation

Mission variables include weather/time/faction/alert baseline/guard count/commander/vehicles/special units/prisoners/resources/blueprints/reinforcement speed.

Capture condition: neutralize or route active enemies, disable command/alarm response, optionally plant control node, then extract.

## 11) Mission Types

Repeatable side missions plus modifiers (no-kill, no-alert, time limits, weather hazards, reinforcement pressure, rival PMC, etc.) and a data-driven objective/reward/failure structure.

## 12) Recruitment / Captured Enemy System

Captured nonlethal enemies pass through post-mission processing into staff candidates with stats, traits, loyalty, injuries, and specialization. Players can recruit/reject/reassign/fire/promote/bench and optionally refine low-value staff into progression resources.

## 13) Departments / Base Structure

Core departments:
- Command
- R&D
- Security
- Medical
- Intel
- Logistics
- Manufacturing
- Brig/Processing
- Training
- Dispatch

Each contributes systemic boosts to capacity, survivability, intel quality, production, and operational throughput.

## 14) R&D System

Research requires money/materials/data/staff/time and spans category trees (weapons, stealth tech, extraction, medical, hacking, base modules) across tiered progression from practical to experimental.

## 15) Equipment / Loadouts

Slots include primary/secondary/support, gadgets, throwable, suit, passive module, and recovery item. Equipment has data-driven stats (damage, weight, noise, suppression, accuracy, tranq, reload, ammo, durability, concealability).

## 16) Dispatch Missions

Simulation-based operations with team/risk/loadout/travel/stat inputs. Outputs include success tier, rewards, injuries, KIA/MIA, morale shifts, and faction heat impact.

## 17) Resource Economy

Core resources:
- Money/credits
- Fuel/energy
- Metals
- Chemicals
- Electronics
- Medical supplies
- Intel data
- Rare prototype parts
- Staff morale
- Regional influence

Used for research, manufacturing, base upgrades, dispatch, loadouts, processing, and deployment.

## 18) Progression and World Structure

Regions and factions define threat, biome, behavior, elite units, resource profiles, and staff archetypes. Heat/threat escalates enemy countermeasures and can be reduced through strategic actions.

## 19) Extraction System

Rewards count only on successful extraction. Extraction type and local conditions influence delay, risk, and reinforcement pressure.

## 20) Health / Injury / Recovery

Player field state and staff injury model integrate with medical recovery, dispatch attrition, and long-term roster planning.

## 21) Companion / Support System

Optional support calls (supply, recon, sniper, vehicle, drone, medevac, emergency extraction) gated by unlocks, staff, cost, cooldown, and comms.

## 22) Mission Scoring / Rewards

Rank factors include objectives, time, stealth discipline, capture value, damage taken, and tactical cleanliness. Rewards include money/materials/intel/morale/influence/blueprint chance.

## 23) Save Data / Meta Systems

Persist roster, injuries, assignments, departments, research, inventory, region/faction state, mission history, and player upgrades.

## 24) Recommended Data Structures

Use data-driven definitions for:
- Enemy (class/faction/stats/perception/combat/recruitability)
- Staff (source/stats/traits/status/growth)
- Weapon (behavior/unlocks/cost)
- Mission (region/objectives/modifiers/rewards/seed)
- Outpost module (layout/cover/cameras/loot/routes)

## 25) MVP Build Order

### Phase 1: Core Field Prototype
Movement, combat basics, stealth, LOS/FOV, patrol/search AI, simple outpost, extraction, nonlethal capture, results screen.

### Phase 2: Procedural Mission Layer
Outpost templates, objectives, patrol variation, rewards, side missions, region map.

### Phase 3: Base Loop
Roster processing, departments, research, economy, loadouts.

### Phase 4: Dispatch Mode
Team assignment, simulation, outcomes, injury/reward loop.

### Phase 5: Expansion
Factions, biomes, advanced gadgets, heat/threat depth, support calls, elite units, rare blueprint systems.

## 26) AI Coding Priorities

1. Readable modular systems over hardcoded scripts.
2. Reusable stealth/AI/outpost generation.
3. Nonlethal capture and recruitment tightly coupled to progression.
4. Every mission feeds base loop.
5. Curated module generation over pure randomness.

## 27) Feature Summary

Top-down stealth action with LOS/FOV detection, patrol/search/combat AI, lethal/nonlethal routes, body handling, procedural outposts, side ops, extraction, recruitment, staff management, departments, R&D, dispatch, faction heat, regional progression, support calls, and multi-biome/faction content.

## 28) Identity Hooks

- Corporate/private-military satire
- Enemy-to-employee pipeline
- Staff refinement + department optimization
- Outpost capture economy
- Dispatch feeding field operations
- Retro presentation with deep systems

## 29) One-Sentence Directive

Build Operation Corporation as a modular retro top-down stealth sandbox where every infiltrated outpost feeds a larger corporation-building loop through extraction, recruitment, research, dispatch, and territorial control.
