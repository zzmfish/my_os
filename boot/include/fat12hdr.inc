BS_OEMName              DB 'ForrestY'       ; OEM String，必须8个字节
BPB_BytesPerSector      DW 512              ; 每扇区字节数
BPB_SectorsPerCluster   DB 1                ; 每簇多少扇区
BPB_ReservedSectorCount DW 1                ; Boot记录占用多少扇区
BPB_FATCount            DB 2                ; 共有多少个FAT表
BPB_RootEntryCount      DW 224              ; 根目录文件最大数
BPB_TotalSector16       DW 2880             ; 逻辑扇区数
BPB_Media               DB 0xF0             ; 媒体描述符
BPB_FATSize             DW 9                ; 每FAT扇区数
BPB_SectorPerTrack      DW 18               ; 每磁道扇区数
BPB_HeadCount           DW 2                ; 磁头数
BPB_HiddenSector        DD 0                ; 隐藏扇区数
BPB_TotalSector32       DD 0
BS_DriverNumber         DB 0                ; 中断13的驱动器号
BS_Reserved1            DB 0
BS_BootSignature        DB 0x29             ; 扩展引导标记
BS_VolumeID             DD 0                ; 卷序列号
BS_VolumeLabel          DB 'MyOS1.0   '     ; 卷标
BS_FileSystemType       DB 'FAT12   '       ; 文件系统类型
