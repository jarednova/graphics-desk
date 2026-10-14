# CHARTS.md

Rules for every chart, stat and table we make. They cover what the marks mean, so a chart made by anyone in the company reads the same way as every other one.

This is a working copy. It comes from the internal finance dashboards I build at Upstatement, and it keeps changing as I use it. Last updated 2026-10-14.

## How to use this file

- **Keep it at the root of the repo**, next to CLAUDE.md or AGENTS.md, and point that file at it, so an agent reads it before it draws anything.
- **Apply it twice:** once when a chart is built, so it starts from the right guidance, and again when the chart is reviewed, before anyone else sees it. The review is a naive read: does every mark mean what this file says it means?
- **Keep Part 1, replace Part 2.** Part 1 holds the rules that should hold anywhere. Part 2 holds company-specific meanings: which colors your own numbers get, and the thresholds behind them. Review it and insert your own.

Two kinds of rule live here:

- **Tokens are absolute.** A token means one thing on every page. If a chart needs a meaning that no token carries, add a token here first. Don't borrow one that is already taken.
- **Prose is judgment.** Where an axis stops, how many steps a ramp gets, whether a grid helps. Follow it by default, and say so in the review when you depart from it.

The code is the definition. If this file and the running CSS disagree, the CSS wins, and this file needs fixing.

---

# Part 1: The rules

## Data or chrome

These rules govern marks that carry data: a bar, a line, a cell's value or color, and a pill that classifies a row's data, like its stage, probability or payment status. Interface chrome is everything that reports or changes what the app or the reader is doing: controls, row states, editors, and pills like "Override passed". Chrome follows "Chrome in tables" (under Tables) and the gray interface tints. The Principles don't apply to it.

When a mark could be either, ask whether it would still be true if nobody had touched the page. A bill is overdue whether or not anyone opened the ledger, so its pill is data. A row is being edited only because someone clicked it, so its tint is chrome.

## Principles

The rules in this file follow from a few ideas. When a case isn't covered, reason from these. When a rule seems to fight one, say so in the review: either the rule or the principle needs fixing.

1. **Each channel answers one question.** Hue says what kind of thing a mark is, lightness how sure, line style and hatching whether it has landed, weight which series is the point, and position how much. A channel asked to answer two questions makes the reader guess which one it means.
2. **One texture per mark at rest.** Hatching, segment outlines, a tinted zone and a dotted line each read well alone. Stacked on one mark they cross into a plaid, and the reader sees noise before meaning. If a mark already carries a texture, any other structure waits for hover.
3. **The shape at rest, the detail on hover.** A chart makes its point with no interaction. Hover and tap add detail, and may quiet a texture to make room for it, but they never change what a mark means.
4. **Draw each value once.** Two marks on one value compete, and the reader looks for a difference that isn't there. Where a zone's edge already sits on a value, the line can stop. The edge carries the value even where data covers it, as long as something else is the reference there: past now, the bars are read against the needed pace, and the tooltip still gives each bar's distance from budget.
5. **A line that changes job stays one line.** When one reference hands off to another, like the budget pace to the needed pace, the hue changes and the weight and dash don't, and the joint gets no dot. Weight ranks separate lines. It doesn't break one line in two.
6. **Zones under, marks over.** A shaded zone behind the data gives context. In front, it tints the data and changes its color. Lines and labels go on top, and a label that crosses data gets a halo in the card color.
7. **A reference stops where it stops being true.** A budget belongs to its year, so its line ends at the year divider, and so does every comparison against it, tooltips included.
8. **Words follow the marks.** Titles, insights and tooltips draw the same boundaries as the chart. If the hatching starts this week, "projected" starts this week too.
9. **Recalculated isn't unsettled.** A pace that's recomputed every week is still a marker: a reference to read against, not a value waiting to land. Long dash and hatching are for values that will land.

## Color

Chrome is gray and type. Color appears only on data and on interface status (see "Chrome in tables").

Readers see color before they read the legend. Red means bad and green means money whether we assign that or not, so we assign it.

### Shared and local

Color rules live at two levels.

- **Shared:** one palette file holds the colors and the decisions every tool in the company shares. Don't add a color that isn't there.
- **Local:** each project's CHARTS.md says how that project uses those colors: its meanings, its hue families and its chart rules.

When a local rule should hold everywhere, promote it to the shared file, one repo at a time rather than all at once.

### Hue families

Hue says what kind of thing a mark is. Lightness says how sure it is. Line style and hatching say whether it has landed. Someone who has read this list should be able to predict a chart's colors without opening the Meanings table.

- **Green is money.** Lighter green is less certain money: a probability ramp, a forecast range. Money in play is green even though it's real, so this year's revenue is green.
- **Blue is what's real.** Things that exist or already happened: projects and their stages, last year, the current month. It also covers where a forecast lands, so the landed actual and the likely landing are both blue. Never a probability of money, a projection or a goal.
- **Purple is a goal.** Budget, plan, target, in dollars or in hours. Planned hours from a staffing plan are purple too. Never anything measured.
- **Red is a loss.** Down deltas, critical, lost.
- **Yellow says look.** Watch and warning. Never a plan, even a plan of hours (that's purple).
- **Gray is the interface, and anything projected.** A projection is gray. Its line is long-dashed and its area or cell is hatched, but a range around it stays a pale solid fill and a projected figure stays full-strength text (see Line style). It never borrows blue, and it never borrows the green of the money it projects.
- **Amber is the model.** A model's output is a special kind of projection: a machine computed it from a lot of moving parts. So it gets its own hue instead of projection gray. Amber is gold, and gold is C-3PO, a robot. Silver would say "robot" better, but on screen it reads as gray, which plain projections already hold.

A deal versus a project is the clearest case. A deal is green because it's a probability of money. A project is blue because it exists.

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
- **Test what you can.** A test can enforce the two tiers, the one-hop rule, any locked ramp, and that every meaning in this file exists in the CSS.

Line styles work like meanings: each token names a job, holds a dash pattern and carries a one-line definition. Use them, never a hand-typed dasharray. Write them from CSS or an inline style, because SVG presentation attributes don't resolve `var()`.

- **`--line-marker`** (`2 3`, dotted) is a marker: a computed line you read the data against, never something measured. Use it for:
  - **paces**: budget pace, needed pace, planned pace
  - **targets**: a margin target, a utilization target, the centre of a target band
  - **statistics**: averages, medians
  - **reference points**: today, end of month, breakeven, day 0

  Never use it for data, a projection, or last year.
- **`--line-unsettled`** (`5 4`, long dash) is not settled: a projection, or a value that will land but hasn't yet, like projected cash, booked work ahead, a model's line, or a month whose books are still open. It's the line form of hatching. Never use it for a target or pace (that's `--line-marker`) or for last year (that's faded).

Axes, gridlines and "no data" use the gray interface tints, never a meaning.

### Rules

- **Entities are labeled, not colored.** No chart colors a client, practice or team. If a chart needs to tell entities apart, use position, labels or small multiples. Don't add an entity palette.
- **A likelihood is a stepped ramp, never a smooth gradient.** Line the steps up with the stages people already talk about, and keep the boundaries visible. Lock the ramp's values once they're set.
- **Pairs keep their meaning.** A comparison is drawn the same way everywhere: the subject heavier, the comparison thinner and faded. A forecast keeps one look on every page.
- **Up and down carry an arrow as well as a color.** ▲ green, ▼ red, so the sign survives for colorblind readers.
- **Light colors are fills, not text.** Yellow especially is too light to read at small sizes. Give it a darker text variant and use that for words.

## Line style

Line style says whether a number has landed. Hue says what kind of thing it is, so two marks in the same style are told apart by hue and weight.

| style | means | examples |
|---|---|---|
| **Solid** | Measured and final. | This year's revenue |
| **Long dash** (`--line-unsettled`) on a line, **hatching** on an area, bar or cell | Not settled: the future, or a value that will land but hasn't yet. The same idea in two forms, since a line can't be hatched. | Projected cash, booked work ahead, a model's line, months whose books are still open |
| **Dotted** (`--line-marker`) | A marker: a pace, average, target or reference point. Computed, never measured. | Budget pace, needed pace, target lines, averages, medians, today, breakeven |
| **Faded** (opacity) | The past. It landed, so it stays solid. It fades because it isn't the subject. | Last year |

- **Fade the past, hatch what's unsettled.** Opacity is rare and stepped. Use it mostly for the past, and for zones (below). When it shows a quantity, use no more than two or three named steps, because it's hard to tell 65% from 35%. Instead of fading, reach for weight, empty indicators and other tools. To show that a number hasn't landed, hatch it.
- **A month stays hatched until its books close.** Hatch from the first month whose books are still open, not from the current month. The two differ for the first days of each month, while last month is still closing.
- **Hatching is a texture over the full color.** Draw the mark in its own color, then lay light stripes over it: white, or the page background in dark mode, at about half strength. On a fill too pale for white to show, use ink stripes instead. The hue stays easy to read, so a hatched month still reads as money, and the texture adds that it hasn't landed. Never hatch with colored stripes on an empty fill. The mark thins out and reads paler, and paleness already means "less sure".
- **The hatch is one spec.** Stripes at 45°, 8px apart and 2.4px wide: white at 0.5 over deep fills, and ink at about 13% over pale ones. In a chart that hatches, segment outlines stay hidden in every bar, landed or not, until that bar is hovered or tapped, so solid versus hatched is the only difference at rest. On hover a hatched bar's stripes fade to 0.3 so its outlines can be read (Principles 2 and 3). Both changes take 300ms. A table cell or legend swatch draws the same stripes as a CSS gradient.
- **Opacity can make a zone.** A zone is a layer the data sits on, not a mark, and opacity is what lets it interact with what's around it: bars cover it, gridlines show through, and it keeps the hue of the marker that bounds it. Tint a zone with that marker's meaning at 0.16, like the band between the budget and needed paces. Fading a mark is still mostly for the past.
- **A range stays a pale solid fill.** A range is a spread of possible values, not one value still to land. Its paleness says how sure it is, and the dash goes on the line through it.
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

1. **Eyebrow:** the page the panel belongs to.
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
- **Status pills use interface status, whether the pill is data or chrome.** Green text on a pale green fill, red on pale red. A warning pill is body text on pale yellow, because yellow is too light to read as text. A neutral state is gray. That covers payment status, overdue and a direction pill like AR/AP, which keep green and red as status even though money out isn't a loss. A pill that classifies data by probability or stage uses the probability ramp like any other mark.
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
| `--money` | soft green | the main money series; revenue this year | a client, team or practice |
| `--money-certain` | deep green | signed money, exceeding target | anything still uncertain |
| `--money-pale` · `--money-glow` · `--money-glow-soft` | pale green; faint green tints | fills and glows for the money series | |
| `--net-income` | bright emerald | net income; needed pace when on track | revenue |
| `--net-income-landing` · `--net-income-pale` | darker emerald; light green | likely landing and fills on the net income forecast | revenue |
| `--prior` · `--prior-pale` · `--prior-glow` | slate blue; pale blue; faint blue tint | last year, prior period | this year, a projection |
| `--watch` · `--watch-pale` | marigold; pale yellow | behind pace by up to 20%, needs a look; fills, dots and the needed-pace line when behind | decoration, highlights, small text |
| `--loss` | coral red | down deltas, critical, more than 20% behind | a cost we chose to incur |
| `--budget` | purple | the budget pace line and budget zones; planned hours from staffing plans | actuals, including the actual hours burned against a plan |
| `--forecast-landing` · `--forecast-range` · `--forecast-tint` | sky blue; palest green; palest blue | likely landing and predictive range on the revenue forecast | actuals, targets |
| `--model` | amber | a model's output: the model line on the revenue forecast, the P&L's predictions | warnings (that's `--watch`), a plain projection (that's `--projected`) |
| `--projected` | mid gray | anything projected: lines, ranges, cells and figures that haven't happened | last year, actuals, a model's output, the revenue forecast's range and landing |
| `--margin-target` | purple | the target line on margin charts | anything else |
| `--in-flight-margin` | navy | the in-flight margin's reference line on margin charts | a project's own margin, a target |
| `--target-band` | lavender | target ± tolerance band fill | |
| `--now` | navy | the current-month label, the active toggle | a data series |
| `--utilization-under-far` · `--utilization-under` · `--utilization-on-target` · `--utilization-over` · `--utilization-over-far` | pale warm gray; light gray; peach; dark gray; near-black | utilization heatmap cells, by gap to the row's own target | a raw level with no target; chart lines |
| `--probability-100` … `--probability-0` | deep green down to cream; red for lost | deal probability; pipeline stage pills | anything but probability |
| `--stage-in-progress` · `--stage-completed` · `--stage-on-ice` | royal blue; navy; palest blue | project stage pills that sit off the probability ramp | chart series |
| `--text` · `--bg` · `--surface` | near-black navy; off-white; white | text, page background, card surface | data |
| `--success` · `--success-pale` · `--warning` · `--warning-text` · `--warning-pale` · `--danger` · `--danger-pale` | deep green; palest green; marigold; dark mustard; pale yellow; coral red; palest red | interface status outside charts, including status pills and chips on their pale fills; `--success` and `--warning-text` also ink up deltas and pace labels on charts | chart series (use the chart meanings) |

## Rules

- **Behind pace has two steps.** Up to 20% behind is `--watch`. More than 20% behind is `--loss`.
- **Arrows take the status meanings.** ▲ is `--success` and ▼ is `--loss`.
- **Status pills pair ink with a pale fill.** Green is `--success` on `--success-pale`, red is `--danger` on `--danger-pale`, and a warning is `--text` on `--warning-pale`.
- **The probability ramp has seven visible steps.** From `--probability-100` down: signed (deep green), booked (90%, soft green), SOW (75%, pale green), SOW in development (65%, pale yellow), proposal discussion (50%, light gray), proposal pending (25%, taupe) and lead (10%, cream). 5% shares the 10% step. Lost (0%) is red and stays off charts. The values are locked, and a test fails if one changes.
- **A pipeline stage is its probability.** Stage pills draw each stage from lead through signed (and lost) in its `--probability-*` step, so a pill and a probability chart never disagree. Proposal pending and opportunity identified share the 25% step. Only project states off the ramp keep a `--stage-*` meaning: royal blue for in progress, navy for completed, pale blue for on ice.
- **Project health is measured against the project's own target.** Exceeding is `--money-certain`, healthy is `--money`, watch is `--watch`, critical is `--loss` and no data is the gray border tint. Within 5 points of target counts as on target.
- **Utilization cells are colored by gap to their own target.** Under and over are gray ink. `--utilization-on-target` (peach) appears only within ±5 points, so a hit is the one warm cell on the grid. The steps are ±5 and ±15 points. The cell's text is always the raw billable %.
- **This year against last year** is always `--money` (2px) against `--prior` (1.5px, faded).
- **The revenue forecast is the one exception to projection gray.** It's a solid pale-green range (possible money), a sky-blue likely landing and an amber model line. It stays off purple so a forecast never reads as a target, and off slate and pale blue so it never reads as last year.
- **Net income forecasts are green throughout.**
- **Not every hue has a family yet.** Peach, the utilization hit, sits next to amber on the orange track but doesn't share its meaning. Magenta is off the charts entirely. The probability ramp crosses yellow and gray because its steps are locked.

## Known conflicts

None open. When the code disagrees with a rule here and the fix isn't obvious, add a bullet here rather than picking an answer quietly.

---

## Not written yet

Nothing right now.
