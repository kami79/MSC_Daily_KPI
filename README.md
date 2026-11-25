# Korek Telecom Core NOC - MSC & MGW Daily/Hourly KPI Portal

Live Core Network Performance Engineering portal that queries Sybase IQ ENIQ (`ar3ens1`) via ODBC (`MSC_Daily.txt`, `MSC_Hourly.txt`, `MGW_GCP_DAily.txt`, `MGW_GCP_Hourly.txt`, `MGW_KPI_Hourly.txt`) and delivers real-time daily & hourly KPI telemetry, an interactive 18-Governorate Iraq Geographical KPI Map, automated SLA breach detection, Root-Cause correlation, and executive Excel/HTML reports.

## Quick Start
1. Copy `.env.example` to `.env` and fill in your ENIQ ODBC credentials (`ENIQ_DSN`, `ENIQ_UID`, `ENIQ_PWD`).
2. Double-click **`Run_MSC_Dashboard.bat`** to launch the web portal on **`http://localhost:8081`**.
3. Double-click **`Run_Sync_MSC_KPIs.bat`** for an on-demand CLI sync from ENIQ into `data/msc_kpi.db`.
4. Double-click **`Run_Generate_Report.bat`** to export formatted Excel (`output/MSC_MGW_Executive_KPI_Report.xlsx`) and printable HTML (`output/MSC_MGW_Executive_Report.html`) executive reports.
5. Right-click **`Open_Firewall_Port_8081.bat`** (*Run as administrator*) if colleagues on the company LAN need access.

## Monitored Core Topology
- **North Pool (`ARBC01`, `ARBC02`)**: Erbil, Duhok, Sulaymaniyah, and Nineveh (Mosul)
- **North-Central (`ARMSS5`)**: Kirkuk
- **Central (`BGBC01`, `BGBC02`)**: Baghdad
- **South (`BSMSS2`)**: Basra
- **Media Gateways (18 MGWs)**: `ARMGW01–06`, `TRMGW01–02`, `TEMGW1`, `DUMGW01–02`, `SUMGW01–02`, `KIMGW01`, `BBMGW01–02`, `TBGMGW1`, `BSMGW1`

## Portal Pages & Capabilities
1. **All KPIs Wall (39)**: One-screen overview of all 38 MSC KPIs + MGW GCP with Daily/Hourly toggle, Custom Date picker, Domain filter, Per-Node multi-select chips, Customize KPIs modal, and click-to-expand chart modal.
2. **Executive Overview**: 4 hero KPI cards, Live Core Topology, Node Health bars, 6 SVG-ring node cards with Slide-Over Node Inspector drawer, and 48-hour CSSR & Erlang curves.
3. **Iraq KPI Map**: Official offline GADM 4.1 18-Governorate Iraq GeoJSON with:
   - 4 Layers: **MSC (38)**, **MGW (13)**, **Composite NOC Health Score**, and **Data Subscribers** (from `Subs_Dash`).
   - 3 Palettes: **Heatmap**, **Colorful**, and **Delta (Change vs Prev)** + animated Core backbone links.
   - **Time-Lapse Replay** scrubber (`0.5× / 1× / 2×`), **Side-by-Side Governorate Comparison** with SLA threshold lines, **Focus Worst**, **PNG/CSV Export**, and **Auto-Cycle** NOC Wallboard mode.
4. **MSC Daily KPIs**: 180-day archive across 7 domains + 38-KPI Scorecard with DoD/WoW deltas.
5. **MSC Hourly KPIs**: Hour×Day heatmap, diurnal profile, 24h polar clock, and busy-hour analysis.
6. **Root-Cause & Causal Graph**: 14-node causal dependency graph and Pearson correlation matrix.
7. **MGW Monitor (13 KPIs)**: Unified view of GCP Context Seizure SR + 12 MGW KPIs (RTP User Plane, IP/TDM Sig Quality, Jitter, Late Pkts, Call Setup Rate, Data Availability, Media Stream Channel Util) with live today `_RAW` hours + 30-day `_COUNT` history.
8. **SLA & Incidents**: Automated breach & missing-node detection with live SLA threshold editor.
9. **Sync & Operations**: 15-minute background ENIQ sync, manual triggers, execution logs, and multi-sheet Excel export.
