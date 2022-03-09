#
# Copyright (C) 2017-2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

INSTALLED_KERNEL_TARGET := $(PRODUCT_OUT)/kernel
recovery_ramdisk := $(PRODUCT_OUT)/ramdisk-recovery.img

RECOVERY_KMOD_TARGETS := \
    utags.ko \
    mmi_annotate.ko \
    mmi_info.ko \
    tzlog_dump.ko \
    mmi_sys_temp.ko \
	exfat.ko \
	sensors_class.ko \
	sx933x_sar.ko \
	ilitek_v3_mmi.ko \
	qpnp_adaptive_charge.ko \
	fpc1020_mmi.ko \
	mpq-adapter.ko \
	snd_smartpa_aw882xx.ko 
    
INSTALLED_RECOVERY_KMOD_TARGETS := $(RECOVERY_KMOD_TARGETS:%=$(TARGET_RECOVERY_ROOT_OUT)/vendor/lib/modules/%)
$(INSTALLED_RECOVERY_KMOD_TARGETS): $(INSTALLED_KERNEL_TARGET)
	echo -e ${CL_GRN}"Copying kernel modules to recovery"${CL_RST}
	@mkdir -p $(dir $@)
	cp $(@F:%=$(TARGET_OUT_VENDOR)/lib/modules/%) $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib/modules/

$(recovery_ramdisk): $(INSTALLED_RECOVERY_KMOD_TARGETS)