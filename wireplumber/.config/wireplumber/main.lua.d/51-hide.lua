rules = {
  {
    matches = {
      {
        {
          "node.name",
          "equals",
          "alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_3__sink",
        },
      },
    },
    apply_properties = {
      ["node.disabled"] = true,
    },
  },
  {
    matches = {
      {
        {
          "node.name",
          "equals",
          "alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_4__sink",
        },
      },
    },
    apply_properties = {
      ["node.disabled"] = true,
    },
  },
  {
    matches = {
      {
        {
          "node.name",
          "equals",
          "alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_5__sink",
        },
      },
    },
    apply_properties = {
      ["node.disabled"] = true,
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
      ["node.disabled"] = true,
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
      ["device.disabled"] = true,
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
      ["device.disabled"] = true,
    },
  },
}

for _, rule in pairs(rules) do
  table.insert(alsa_monitor.rules, rule)
end
