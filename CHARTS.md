# CHARTS.md

These are the rules for every chart, stat and table we make. They cover what the marks mean, so a chart made by anyone in the company reads the same way as every other one.

This is a working copy. It comes from the internal finance dashboards I build at Upstatement, and it keeps changing as I use it. Last updated 2026-10-15.

## How to use this file

- **Keep it at the root of the repo**, next to CLAUDE.md or AGENTS.md, and point that file at it, so an agent reads it before it draws anything.
- **Apply it twice:** once when a chart is built, so it starts from the right guidance, and again when the chart is reviewed, before anyone else sees it. The review is a naive read: does every mark mean what this file says it means?
- **Keep Part 1, edit Part 2.** Part 1 holds the rules that should hold anywhere. Part 2 holds company-specific meanings: which colors your own numbers get, and the thresholds behind them. Review it and insert your own.

Two kinds of rule live here:

- **Tokens are absolute.** A token means one thing on every page. If a chart needs a meaning that no token carries, add a token or value. Don't borrow one that is already taken.
- **Prose is judgment.** Where an axis stops, how many steps a ramp gets, whether a grid helps. Follow it by default, and say so in the review when you depart from it.

These are defaults. They can't anticipate every chart, and they don't try to. Depart from one when a chart needs it, and write down which rule and why, so the departure stays a single decision. An agent can depart from a judgment rule but must name it in the review. It doesn't depart from a meaning on its own: it proposes the departure and asks. A departure that sticks gets written into Part 2, next to the meaning it bends.

The CSS holds the values, and this file holds the meanings. If the two disagree on a value, the CSS wins and this file needs fixing. If they disagree on what a mark means, log it under Known conflicts instead of silently picking an answer.

---

# Part 1: The rules

## Data or chrome

These rules govern marks that carry data: a bar, a line, a cell's value or color, and a pill that classifies a row's data, like its stage, probability or payment status. Interface chrome is everything that reports or changes what the app or the reader is doing: controls, row states, editors, and pills like "Override passed". Chrome follows "Chrome in tables" (under Tables) and the gray interface tints. The Principles don't apply to it.

When a mark could be either, ask whether it would still be true if nobody had touched the page. A bill is overdue whether or not anyone opened the ledger, so its pill is data. A row is being edited only because someone clicked it, so its tint is chrome.

## Principles

The rules in this file follow from a few ideas. When a case isn't covered, reason from these. When a rule seems to fight one, say so in the review: either the rule or the principle needs fixing.

1. **Each channel answers one question.** Hue says what kind of thing a mark is, saturation how high it sits, a lighter step on the same track how sure, opacity how far back, line style and hatching whether it has landed, weight which series is the point, and position how much. Weight is a line's stroke, so it ranks lines and never sets a bar's width. A narrower bar reads as a different kind of thing, not a lesser one. Position and arrows say which way a number moved, and color says whether that's good. A channel asked to answer two questions makes the reader guess which one it means.
2. **One texture per mark at rest.** Hatching, segment outlines, a tinted zone and a dotted line each read well alone. Stacked on one mark they cross into a plaid, and the reader sees noise before meaning. If a mark already carries a texture, any other structure waits for hover. Reserve your tools and deploy carefully.
3. **The shape at rest, the detail on hover.** A chart makes its point with no interaction. Hover and tap add detail, and may quiet a texture to make room for it, but they never change what a mark means.
4. **Draw each value once.** Two marks on one value compete, and the reader looks for a difference that isn't there. Where a zone's edge already sits on a value, the line can stop. The edge carries the value even where data covers it, as long as something else is the reference there: past now, the bars are read against the needed pace, and the tooltip still gives each bar's distance from budget.
5. **A line that changes job stays one line.** When one reference hands off to another, like the budget pace to the needed pace, the hue may change, and the weight and dash don't, and the joint gets no dot. Weight ranks separate lines. It doesn't break one line in two.
6. **Zones under, marks over.** A shaded zone behind the data gives context. In front, it tints the data and changes its color. Lines and labels go on top, and a label that crosses data gets a halo in the card color.
7. **A reference stops where it stops being true.** A budget belongs to its year, so its line ends at the year divider, and so does every comparison against it, tooltips included.
8. **Words follow the marks.** Titles, insights and tooltips draw the same boundaries as the chart. If the hatching starts this week, "projected" starts this week too.
9. **Recalculated isn't unsettled.** A pace that's recomputed every week is still a marker: a reference to read against, not a value waiting to land. Long dash and hatching are for values that will land.
10. **Time runs oldest to newest.** Left to right along a time axis, and within each group on it, so last year's bar sits before this year's. Reverse it only for a reason the chart can state.
11. **A pace is a running total.** It's the cumulative path to a goal: where the total should stand at each point to land on the goal at the end. The budget pace is constant: it's set with the budget and doesn't move when actuals land. The needed pace is the one that varies with performance: it runs from the actual total at now to the goal, so it steepens when we fall behind and eases when we get ahead. A chart against pace plots running totals, so the gap at now is the distance between the lines. A line through each month's own budget isn't a pace. Call it the monthly budget.

## Color

Chrome is gray and type. Color appears only on data and on interface status (see "Chrome in tables").

Readers see color before they read the legend. Red means bad and green means money whether we assign that or not, so we assign it. Gray means the chart has no opinion.

### Shared and local

Color rules live at two levels.

- **Shared:** one palette file holds the colors and the decisions every tool in the company shares. Don't add a color that isn't there.
- **Local:** each project's CHARTS.md says how that project uses those colors: its meanings, its hue families and its chart rules.

When a local rule should hold everywhere, promote it to the shared file, one repo at a time rather than all at once.

### Hue families

Hue says what kind of thing a mark is. A lighter step says how sure it is, and opacity how far back. Line style and hatching say whether it has landed. Someone who has read this list should be able to predict a chart's colors without opening the Meanings table.

- **Green is money.** Lighter green is less certain money: a probability ramp, a forecast range. Money in play is green even though it's real, so this year's revenue is green. Money is green in every tense: last year's revenue is green and faded, and projected revenue is green and long-dashed or hatched.
- **Blue is what exists.** Projects and their stages. Navy also marks now, on the current-month label. Never money, a probability or a goal. Blue never says a mark is projected or past on its own: a projected or past project keeps its blue, long-dashed, hatched or faded.
- **Purple is a goal.** Budget, plan, target, in dollars or in hours. Planned hours from a staffing plan are purple too, and so is the needed pace while it's on track, since it's the budget recomputed. Never anything measured.
- **Red is bad.** A loss, a delta moving the bad way for its metric, critical, lost.
- **Yellow says look.** Watch and warning. Never a plan, even a plan of hours (that's purple).
- **Gray is no judgment.** A gray mark is a fact the chart has no opinion about: headcount, a cost we chose to incur, every part of a highlight chart except the one that's the point. Weight and contrast say whether it's the subject. Data gray is `--neutral`, a separate token from the interface grays even where they share a value, so a gray slice gets reviewed as data and a gray border as chrome.
- **A projection takes the hue of what it projects.** Its line is long-dashed and its area or cell is hatched, a range around it stays a pale solid fill, and a projected figure stays full-strength text (see Line style).

A deal versus a project is the clearest case. A deal is green because it's a probability of money. A project is blue because it exists.

### Hot colors

Every palette has some colors hotter than the rest: vivid and saturated, the first thing the eye lands on. Mark them in the color file, or in Part 2 if the color file doesn't.

- **Reserve them for metrics that show up rarely but matter when they do.** A hot color stays hot only while it's rare, so it never goes on chrome, on highlights, or on anything that appears on most pages.
- **Assigning one is a meaning decision.** An agent proposes it and asks.
- **Give it a second difference.** When a hot color shares a card with the medium color of its family, the two also differ in weight, form or a label. Saturation drops out in print and for colorblind readers.

### Tokens

Color comes in two tiers.

- **Colors** say what a color looks like. They sit on tracks by hue (green, blue, purple, red, orange, yellow, gray), and variants are named by track and step: `--purple-300`. Steps run 50–950, and higher is darker. Each value is written once.
- **Meanings** say what a color is for: `--money`, `--loss`, `--budget`. Each points one hop at a color, with a one-line comment as its definition.

Rules for both:

- **Components, charts, stats and tables use meanings, never colors.** If no meaning fits, add one first. Don't borrow one that's already taken.
- **Two meanings may share a color.** That's a visible decision, not a second name.
- **Retire old names by choosing a meaning.** Keep an old name working as an alias so nothing changes on screen. Migrate each use to the meaning it actually has, then delete the alias once nothing references it.
- **Hatch stripes are a texture, not a color.** They lay white or ink over a meaning, the way opacity does, so the hatch spec (see Line style) gives them as values. The fill underneath is still a meaning.
- **Name a likelihood ramp by its likelihoods.** `--probability-75` is a 75% chance, not a lightness step. The prefix keeps it apart from `--green-200` and the rest.
- **Name the past by its distance.** `--past-1` is one period back and `--past-2` is two. They're opacity steps laid over a meaning, the way hatch stripes are, so they're given as values.
- **Test what you can.** A test can enforce the two tiers, the one-hop rule, any locked ramp, and that every meaning in this file exists in the CSS.

Line styles work like meanings: each token names a job, holds a dash pattern and carries a one-line definition. Use them, never a hand-typed dasharray. Write them from CSS or an inline style, because SVG presentation attributes don't resolve `var()`.

- **`--line-marker`** (`2 3`, dotted) is a marker: a computed line you read the data against, never something measured. Never use it for data, a projection, or last year. Use it for:
  - **paces**: budget pace, needed pace, planned pace
  - **targets**: a margin target, a utilization target, the centre of a target band
  - **statistics**: averages, medians
  - **reference points**: today, end of month, breakeven, day 0
- **`--line-unsettled`** (`5 4`, long dash) is not settled: a projection, or a value that will land but hasn't yet, like projected cash, booked work ahead, a model's line, or a month whose books are still open. It's the line form of hatching. Never use it for a target or pace (that's `--line-marker`) or for last year (that's faded).

Axes, gridlines and "no data" use the gray interface tints, never a meaning.

### Rules

- **Entities are labeled, not colored.** No chart colors a client, practice or team. If a chart needs to tell entities apart, use position, labels or small multiples. Don't add an entity palette.
- **A likelihood is a stepped ramp, never a smooth gradient.** Line the steps up with the stages people already talk about, and keep the boundaries visible. Lock the ramp's values once they're set.
- **Pairs keep their meaning.** A comparison is drawn the same way everywhere: the subject heavier, the comparison thinner, and faded when it's the past. Heavier and thinner are line weights, so between bars only the fade carries over. A forecast keeps one look on every page.
- **Up means up.** Arrows and lines show direction. Color shows whether that direction is good for this metric, and Part 2 declares which way is good for each one. A metric with no declared direction is neither, and draws in `--neutral`. Never invert an axis to make a bad number go down.
- **Prefer metrics where up is good, but don't stretch for it.** When choosing what to show, pick the framing where up is good if it comes naturally: margin over cost ratio, runway over burn rate. Headcount going up is neither good nor bad, so it stays neutral.
- **Every delta carries an arrow as well as a color,** so the direction survives for colorblind readers.
- **Light colors are fills, not text.** Yellow especially is too light to read at small sizes. Give it a darker text variant and use that for words.

## Line style

Line style says whether a number has landed. Hue says what kind of thing it is, so two marks in the same style are told apart by hue and weight.

| style | means | examples |
|---|---|---|
| **Solid** | Measured and final. | This year's revenue |
| **Long dash** (`--line-unsettled`) on a line, **hatching** on an area, bar or cell | Not settled: the future, or a value that will land but hasn't yet. The same idea in two forms, since a line can't be hatched. | Projected cash, booked work ahead, a model's line, months whose books are still open |
| **Dotted** (`--line-marker`) | A marker: a pace, average, target or reference point. Computed, never measured. | Budget pace, needed pace, target lines, averages, medians, today, breakeven |
| **Faded** (opacity) | The past. It landed, so it stays solid, in its own hue. Further back is fainter. | Last year's revenue, in `--money` at `--past-1` |

- **Fade the past, hatch what's unsettled.** Opacity says how far back a number is: last year is faint, and the year before is fainter. Use the named steps, never more than three, because it's hard to tell 65% from 35%. Its only other job is zones (below). To show that a number hasn't landed, hatch it.
- **Faded and pale look alike.** On a card, faded green and pale green are the same color to the eye, and pale means less sure. On a line chart that's fine: the past is a thin line and uncertainty is a fill. On bars, the past never shares a chart with the probability ramp or a range.
- **A month stays hatched until its books close.** Hatch from the first month whose books are still open, not from the current month. The two differ for the first days of each month, while last month is still closing.
- **Hatching is a texture over the full color.** Draw the mark in its own color, then lay light stripes over it: white, or the page background in dark mode, at about half strength. On a fill too pale for white to show, use ink stripes instead. The hue stays easy to read, so a hatched month still reads as money, and the texture adds that it hasn't landed. Never hatch with colored stripes on an empty fill. The mark thins out and reads paler, and paleness already means "less sure".
- **The hatch is one spec.** Its angle, spacing, width and strength live in the CSS as one token, and every hatch draws from it: bars, table cells and legend swatches alike. In a chart that hatches, solid versus hatched is the only difference at rest, so segment outlines stay hidden until a bar is hovered or tapped. On hover the stripes quiet so the outlines can be read (Principles 2 and 3).
- **Opacity can make a zone.** A zone is a layer the data sits on, and opacity is what lets it interact with what's around it: bars cover it, gridlines show through, and it takes the hue of whatever bounds it. A band between two markers, like the budget and needed paces, takes the markers' meaning at 0.16. A range is a zone too: the spread of possible values around a projection, in its series' hue, pale enough to say how sure it is. It stays solid, because nothing in it is waiting to land, and the dash goes on the line through it. Fading a mark is for the past.
- **Weight shows rank between series.** The series that is the point is drawn heavier than its comparison. A line that hands off to another keeps one weight (Principle 5), so the budget and needed paces share one. A dotted line is a marker at any weight.
- **Hover guides and crosshairs are interface, not data.** They may be dashed, and they never appear in a legend.

## Numbers and dates

Use one set of shared formatters. Never format by hand in a component.

- **Dates are calendar dates, in UTC.** Someone in Amsterdam and someone on the west coast see the same day and month.
- **Money is compact above $1K:** `$42K`, `$1.25M`. Below $1K, show whole dollars.
- **Negatives use an ASCII hyphen:** `-$42K`, not the Unicode minus sign. It pastes into a spreadsheet as a real number, and it's narrower in dense tables. Leave positives unsigned unless gains and losses sit side by side.
- **Ranges use a spaced en dash:** `Mar 9 – Jun 30, 2026`. Show the year once when both ends share it.
- **Figures use tabular numerals** (`font-variant-numeric: tabular-nums`) so columns line up.
- **Missing values show `—`** in a value cell or figure. A sentence about a missing value uses words: "was undated", not "was —".
- **Margins move in points** (`+1.2 pts`). Money moves in compact dollars.

## Anatomy of a chart card

Every panel has the same parts, in this order:

1. **Overline:** the page the panel belongs to.
2. **Title:** what the chart shows.
3. **Subtitle:** the basis of the numbers. It changes when a toggle changes the basis.
4. **Controls:** on the right on wider screens, stacked below the title on phones.
5. **Chart or table.**
6. **Legend:** each mark in the key is drawn the way it's drawn on the chart, with the same stroke, dash and opacity.
7. **Insight:** one takeaway in a sentence, with the key figures in bold. It draws the chart's boundaries: a "projected" insight covers only the hatched periods (Principle 8).

Within the chart:

- **Y axis:** compact dollars on round steps. Leave the top edge unlabeled.
- **Gridlines are a promise that you can read a value off them.** Draw them when the reader needs to read or compare values. Skip them when the chart is about shape. Space them on round values. When the chart is about a rate (Y should grow so much per X), space the grid on that rate, so the expected path runs through the grid's corners and the distance from them is the deviation. Pick the X unit that makes the rate round. The grid backs up the pace line and never replaces it: still draw the expected path as a `--line-marker`. Gridlines stay gray interface and never appear in a legend.
- **Now:** exactly one highlighted label for the current month, and it marks now on its own. Where a pace line turns at now, it turns without a dot (Principle 5).
- **Totals:** show on hover. Hide them on phones. A table's totals row is different: it stays visible (see Tables).
- **Weighted vs raw is a basis, not a series.** The toggle re-bases the whole chart, axis included.
- **Stacks put the likeliest money at the bottom.** Height is dollars, and color is probability.

## Tables

- **A table beats a chart when the reader needs the values, not the shape.** Use one when exact values matter, or when each row carries more than two or three measures, especially in different units, which can't share an axis. A long list with one measure is still a sorted bar chart. A table asks the reader to find a specific row and read across it, so label each row by name, sort by the measure that matters, and link each row to its detail page where one exists. A small bar or a colored cell that helps the eye scan a column still counts as a table.

### Chrome in tables

A table's cells are data and follow the rest of this file. Its row states, headers and editors are chrome (see "Data or chrome"), and these rules cover them. So does the color of every status pill, data or chrome.

- **Hover uses the page background. State uses a faint row tint.** The tint is one faint ink token, used for the row being edited and for totals rows. Hover stays on the page color, so a hovered row never reads as one being edited. Neither is a meaning, and neither is a hand-written rgba.
- **Totals rows stay visible**, below a stronger border rule and on the row tint. A chart hides its totals until hover. A table doesn't.
- **Status pills use interface status, whether the pill is data or chrome.** Green text on a pale green fill, red on pale red. A warning pill is body text on pale yellow, because yellow is too light to read as text. A neutral state is gray. That covers payment status and overdue. A pill that names a category with no verdict, like AR/AP, is `--neutral`. A pill that classifies data by probability or stage uses the probability ramp like any other mark.
- **Sortable headers** show the active column and its direction, and set `aria-sort`.
- **Inline editing:** an editable value looks like a value until it's clicked. Enter or blur saves, and Esc cancels. Never save on `change`, because a native date input fires it for each typed segment. A value set by hand shows the source value and a way back to it.

## Layout

- Mobile first. Every card is full width on a phone, and cards pair up as the screen widens.
- Use spacing tokens for gaps, padding and corner radius rather than raw pixels.
- A panel someone isn't allowed to see collapses. It doesn't leave a hole.

---

# Part 2: Company-specific meanings

Part 1 says what kinds of meaning a chart can carry. This part names the meanings your company actually uses, and the color that draws each one.

**Review this part and insert your own.** What's here now comes from Upstatement's internal finance dashboards: revenue, net income, the sales pipeline, project health and utilization. Keep the meanings that fit, delete the ones that don't, and add the ones your numbers need. Replace each plain color name with the value your project uses, and set the thresholds (20% behind pace, ±5 points of target, the probability steps) to the ones your team works to.

## Meanings

| meaning | color | used for | never used for |
|---|---|---|---|
| `--money` | soft green | the main money series: revenue this year, last year (faded) and projected (long dash or hatched); the likely landing on the revenue forecast | a client, team or practice |
| `--money-certain` | deep green | signed money, exceeding target | anything still uncertain |
| `--money-pale` · `--money-glow` · `--money-glow-soft` | pale green; faint green tints | fills and glows for the money series |  |
| `--net-income` | bright emerald (hot) | net income, including its projection (long dash) | revenue, a pace |
| `--net-income-pale` | light green | the range and fills on the net income forecast | revenue |
| `--past-1` · `--past-2` | opacity: faint; fainter | last year and the year before, laid over the series' own meaning | a projection, a range, a zone |
| `--watch` · `--watch-pale` | marigold; pale yellow | behind pace by up to 20%, needs a look; fills, dots and the needed-pace line when behind | decoration, highlights, small text, a chart with `--model` |
| `--loss` | coral red | a delta moving the bad way, critical, more than 20% behind | a cost we chose to incur (that's `--neutral`) |
| `--budget` | purple | the budget pace line and budget zones; the needed pace while on track; planned hours from staffing plans | actuals, including the actual hours burned against a plan |
| `--forecast-range` · `--forecast-tint` | palest green; palest blue | predictive range on the revenue forecast | actuals, targets |
| `--model` | amber | a model's output: the model line on the revenue forecast, the P&L's predictions. *Departure:* a projection takes the hue of what it projects; a model's output gets its own so the reader knows the method can't be checked by hand | warnings (that's `--watch`), a plain projection (that takes its subject's hue), a chart with `--watch` |
| `--neutral` | mid gray | a fact with no verdict: headcount, a cost we chose to incur, the rest of a highlight chart, a delta on a metric with no good direction, a category pill like AR/AP | chrome (that's the interface grays), or a projection of something that isn't neutral |
| `--margin-target` | purple | the target line on margin charts | anything else |
| `--in-flight-margin` | navy | the in-flight margin's reference line on margin charts | a project's own margin, a target |
| `--target-band` | lavender | target ± tolerance band fill |  |
| `--now` | navy | the current-month label | a data series, a control (an active toggle is ink and weight) |
| `--utilization-under-far` · `--utilization-under` · `--utilization-on-target` · `--utilization-over` · `--utilization-over-far` | pale warm gray; light gray; peach; dark gray; near-black | utilization heatmap cells, by gap to the row's own target | a raw level with no target; chart lines |
| `--probability-100` … `--probability-0` | deep green down to cream; red for lost | deal probability; pipeline stage pills | anything but probability |
| `--stage-in-progress` · `--stage-completed` · `--stage-on-ice` | medium blue; navy; palest blue | project stage pills that sit off the probability ramp | chart series |
| `--text` · `--bg` · `--surface` | near-black navy; off-white; white | text, page background, card surface | data |
| `--success` · `--success-pale` · `--warning` · `--warning-text` · `--warning-pale` · `--danger` · `--danger-pale` | deep green; palest green; marigold; dark mustard; pale yellow; coral red; palest red | interface status outside charts, including status pills and chips on their pale fills; `--success` and `--warning-text` also ink deltas and pace labels on charts, and a delta takes `--success` only when it moves the good way | chart series (use the chart meanings) |

## Metrics

Each metric a chart draws declares which way is good, and its deltas take their color from that (see "Up means up"). This is a starter list. Add every metric your charts draw: one that isn't listed is neither.

| metric | good direction |
|---|---|
| Revenue | up |
| Net income | up |
| Margin | up |
| Pipeline | up |
| Costs | down |
| Headcount | neither |
| Utilization | toward its own target |

## Rules

- **Behind pace has two steps.** Up to 20% behind is `--watch`. More than 20% behind is `--loss`.
- **Deltas take the status meanings by direction.** A delta moving the good way is `--success`, the bad way `--loss`, and on a metric with no good direction, `--neutral`.
- **Hot colors:** emerald, for net income. Magenta and royal blue are in reserve, unassigned.
- **Status pills pair ink with a pale fill.** Green is `--success` on `--success-pale`, red is `--danger` on `--danger-pale`, and a warning is `--text` on `--warning-pale`.
- **The probability ramp has seven visible steps.** From `--probability-100` down: signed (deep green), booked (90%, soft green), SOW (75%, pale green), SOW in development (65%, pale yellow), proposal discussion (50%, light gray), proposal pending (25%, taupe) and lead (10%, cream). 5% shares the 10% step. Lost (0%) is red and stays off charts. The values are locked, and a test fails if one changes.
- **A pipeline stage is its probability.** Stage pills draw each stage from lead through signed (and lost) in its `--probability-*` step, so a pill and a probability chart never disagree. Proposal pending and opportunity identified share the 25% step. Only project states off the ramp keep a `--stage-*` meaning: medium blue for in progress, navy for completed, pale blue for on ice.
- **Project health is measured against the project's own target.** Exceeding is `--money-certain`, healthy is `--money`, watch is `--watch`, critical is `--loss` and no data is the gray border tint. Within 5 points of target counts as on target.
- **Utilization cells are colored by gap to their own target.** Under and over are gray ink. `--utilization-on-target` (peach) appears only within ±5 points, so a hit is the one warm cell on the grid. The steps are ±5 and ±15 points. The cell's text is always the raw billable %.
- **This year against last year** is always `--money` at 2px against `--money` at `--past-1`, 1.5px. As bars, it's `--money` against `--money` at `--past-1`, with last year first.
- **The revenue forecast follows the projection rule.** Its range is a solid `--forecast-range` (possible money), its likely landing is `--money` long-dashed, and its model line is `--model`, the one departure. It stays off purple so a forecast never reads as a target.
- **Net income forecasts are emerald throughout:** the line long-dashed in `--net-income`, the range in `--net-income-pale`.
- **Revenue and net income differ in saturation.** When they share a card, they also differ in weight, form or a direct label (see Hot colors).
- **The needed pace is purple while on track,** `--watch` when behind, and `--loss` when more than 20% behind.
- **Not every hue has a family yet.** Peach, the utilization hit, sits next to amber on the orange track but doesn't share its meaning. Magenta and royal blue are held in reserve as hot colors. The probability ramp crosses yellow and gray because its steps are locked.

## Known conflicts

When the code disagrees with a rule here and the fix isn't obvious, add a bullet here rather than picking an answer quietly.

- **`--forecast-tint` (palest blue).** Blue now means projects, and the revenue forecast no longer draws in blue. Find where this tint is used and give it a meaning, or delete it.
- **Retired names still in the code.** `--projected`, `--forecast-landing`, `--net-income-landing` and the `--prior` set are gone from this file. Keep each working as an alias, migrate every use to the meaning it actually has (a projection to its subject's hue, a landing to its series long-dashed, last year to its own meaning at `--past-1`), then delete the alias.
- **Needed pace on track.** The code draws it in `--net-income`. This file now says `--budget`.

---

## Not written yet

Nothing right now.
