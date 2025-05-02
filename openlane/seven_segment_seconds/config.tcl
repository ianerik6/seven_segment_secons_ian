

# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

# -------------------------------
# Tecnología y celdas estándar
# -------------------------------
set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

# -------------------------------
# Información del diseño
# -------------------------------
set script_dir [file dirname [file normalize [info script]]]
set ::env(DESIGN_NAME) "seven_segment_seconds"

# -------------------------------
# Archivos fuente Verilog
# -------------------------------
set ::env(VERILOG_FILES) [list \
    $script_dir/../../verilog/rtl/defines.v \
    $script_dir/../../verilog/rtl/seven_segment_seconds.v \
]

# -------------------------------
# Tipo de diseño (es un macro)
# -------------------------------
set ::env(DESIGN_IS_CORE) 1  ;# 1 = Macro aislado, 0 = diseño top completo

# -------------------------------
# Reloj
# -------------------------------
set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_PERIOD) "10.0"

# -------------------------------
# Floorplanning
# -------------------------------
set ::env(FP_SIZING) "absolute"
set ::env(DIE_AREA) "0 0 100 250"  ;# Ajustar si hay problemas de espacio
set ::env(FP_CORE_UTIL) 30
set ::env(PL_TARGET_DENSITY) 0.4
set ::env(FP_ASPECT_RATIO) 1.0
set ::env(PL_BASIC_PLACEMENT) 1

# -------------------------------
# Orden de pines (opcional, verificar que exista)
# -------------------------------
set ::env(FP_PIN_ORDER_CFG) "$script_dir/pin_order.cfg"

# -------------------------------
# Capas de ruteo máximas
# -------------------------------
set ::env(RT_MAX_LAYER) "met4"  ;# met4 o inferior para macros

# -------------------------------
# Redes de alimentación
# -------------------------------
set ::env(VDD_NETS) [list "vccd1"]
set ::env(GND_NETS) [list "vssd1"]

# -------------------------------
# Inserción de diodos
# -------------------------------
set ::env(DIODE_INSERTION_STRATEGY) 4  ;# Inserción agresiva, cambiar a 3 o 2 si hay problemas

# -------------------------------
# Verificación formal (CVC)
# -------------------------------
set ::env(RUN_CVC) 0  ;# Desactivado para evitar errores innecesarios en macros
