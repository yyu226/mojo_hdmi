
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name mojo_hdmi -dir "C:/Users/Ying Yu/Desktop/Mojo_v3/mojo_hdmi/planAhead_run_3" -part xc6slx9tqg144-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Ying Yu/Desktop/Mojo_v3/mojo_hdmi/dvi_demo.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Ying Yu/Desktop/Mojo_v3/mojo_hdmi} {ipcore_dir} }
add_files [list {ipcore_dir/ddsc.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "dvi_demo.ucf" [current_fileset -constrset]
add_files [list {dvi_demo.ucf}] -fileset [get_property constrset [current_run]]
link_design
