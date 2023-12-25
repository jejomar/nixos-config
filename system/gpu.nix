{ config, pkgs, ...}:

{
  # Make the kernel use the correct driver version
  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware.opengl = {
    driSupport = true; # Vulkan support
    driSupport32Bit = true; # Vulkan support for 32 bit applications

    extraPackages = with pkgs; [
      rocmPackages.clr.icd # OpenCL support
      amdvlk # Addition to Mesa RADV drivers
      # intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];

    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk # 32 bit addition to Mesa RADV drivers
      pkgsi686Linux.vaapiIntel
    ];
  };

  # Re-enable OpenCL for Polaris based cards
  environment.variables = {
    ROC_ENABLE_PRE_VEGA = "1";
  };
}
