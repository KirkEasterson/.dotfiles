local rules = {
  {
    matches = {
      {
        {
          "node.name",
          "equals",
          "alsa_output.usb-Corsair_CORSAIR_VIRTUOSO_SE_Wireless_Gaming_Headset_15e578e3000000fc-00.iec958-stereo",
        },
      },
    },
    apply_properties = {
      ["node.description"] = "USB Wireless Headset",
      ["node.nick"] = "USB Wireless Headset",
    },
  },
  {
    matches = {
      {
        {
          "node.name",
          "equals",
          "alsa_input.usb-Corsair_CORSAIR_VIRTUOSO_SE_Wireless_Gaming_Headset_15e578e3000000fc-00.mono-fallback",
        },
      },
    },
    apply_properties = {
      ["node.description"] = "USB Wireless Headset",
      ["node.nick"] = "USB Wireless Headset",
    },
  },
  {
    matches = {
      {
        {
          "node.name",
          "equals",
          "alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink",
        },
      },
    },
    apply_properties = {
      ["node.description"] = "Speaker/Headphones",
    },
  },
  {
    matches = {
      {
        {
          "node.name",
          "equals",
          "alsa_input.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_6__source",
        },
      },
    },
    apply_properties = {
      ["node.description"] = "Built-in Microphone",
    },
  },
  {
    matches = {
      {
        {
          "node.name",
          "equals",
          "alsa_input.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__source",
        },
      },
    },
    apply_properties = {
      ["node.description"] = "Headphone Jack Microphone",
    },
  },
  {
    matches = {
      {
        {
          "device.name",
          "equals",
          "alsa_card.usb-Lenovo_ThinkPad_Thunderbolt_3_Dock_USB_Audio_000000000000-00",
        },
      },
    },
    apply_properties = {
      ["device.description"] = "Thunderbolt Dock Headphone Jack",
      ["device.nick"] = "Thunderbolt Dock Headphone Jack",
    },
  },
  {
    matches = {
      {
        {
          "device.name",
          "equals",
          "alsa_card.usb-046d_HD_Pro_Webcam_C920_6C1BEDAF-02",
        },
      },
    },
    apply_properties = {
      ["device.description"] = "Webcam Microphone",
      ["device.nick"] = "Webcam Microphone",
    },
  },
  {
    matches = {
      {
        {
          "device.name",
          "equals",
          "alsa_card.usb-046d_HD_Pro_Webcam_C920_6C1BEDAF-02",
        },
      },
    },
    apply_properties = {
      ["device.description"] = "Webcam Microphone",
      ["device.nick"] = "Webcam Microphone",
    },
  },
  {
    matches = {
      {
        {
          "device.name",
          "equals",
          "libcamera_input.__SB_.PC00.TRP2.PXSX-2.1.3.4_1.0-046d_082d",
        },
      },
    },
    apply_properties = {
      ["device.description"] = "Webcam Microphone",
      ["device.nick"] = "Webcam Microphone",
    },
  },
  {
    matches = {
      {
        {
          "node.name",
          "equals",
          "bluez_output.10_E4_C2_3C_7C_8A.1",
        },
      },
    },
    apply_properties = {
      ["node.description"] = "Bluetooth Headset",
      ["node.nick"] = "Bluetooth Headset",
    },
  },
  {
    matches = {
      {
        {
          "device.name",
          "equals",
          "bluez_card.10_E4_C2_3C_7C_8A",
        },
      },
    },
    apply_properties = {
      ["device.description"] = "Bluetooth Headset",
      ["device.nick"] = "Bluetooth Headset",
    },
  },
}

for _, rule in pairs(rules) do
  table.insert(alsa_monitor.rules, rule)
end
