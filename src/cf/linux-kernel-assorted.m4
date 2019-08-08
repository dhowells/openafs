AC_DEFUN([OPENAFS_LINUX_KERNEL_ASSORTED_CHECKS],[
dnl Assorted more complex tests
LINUX_AIO_NONVECTOR
LINUX_EXPORTS_PROC_ROOT_FS
LINUX_KMEM_CACHE_INIT
LINUX_HAVE_KMEM_CACHE_T
LINUX_KMEM_CACHE_CREATE_TAKES_DTOR
LINUX_KMEM_CACHE_CREATE_CTOR_TAKES_VOID
LINUX_D_PATH_TAKES_STRUCT_PATH
LINUX_NEW_EXPORT_OPS
LINUX_INODE_SETATTR_RETURN_TYPE
LINUX_IATTR_64BIT_TIME
LINUX_IOP_I_CREATE_TAKES_NAMEIDATA
LINUX_IOP_I_LOOKUP_TAKES_NAMEIDATA
LINUX_IOP_I_PERMISSION_TAKES_FLAGS
LINUX_IOP_I_PERMISSION_TAKES_NAMEIDATA
LINUX_IOP_I_PUT_LINK_TAKES_COOKIE
LINUX_DOP_D_DELETE_TAKES_CONST
LINUX_DOP_D_REVALIDATE_TAKES_NAMEIDATA
LINUX_FOP_F_FLUSH_TAKES_FL_OWNER_T
LINUX_FOP_F_FSYNC_TAKES_DENTRY
LINUX_FOP_F_FSYNC_TAKES_RANGE
LINUX_AOP_WRITEBACK_CONTROL
LINUX_FS_STRUCT_FOP_HAS_SPLICE
LINUX_KERNEL_POSIX_LOCK_FILE_WAIT_ARG
LINUX_KERNEL_PAGEVEC_INIT_COLD_ARG
LINUX_POSIX_TEST_LOCK_RETURNS_CONFLICT
LINUX_POSIX_TEST_LOCK_CONFLICT_ARG
LINUX_KERNEL_SOCK_CREATE
LINUX_EXPORTS_KEY_TYPE_KEYRING
LINUX_NEED_RHCONFIG
LINUX_RECALC_SIGPENDING_ARG_TYPE
LINUX_EXPORTS_TASKLIST_LOCK
LINUX_GET_SB_HAS_STRUCT_VFSMOUNT
LINUX_STATFS_TAKES_DENTRY
LINUX_REFRIGERATOR
LINUX_HAVE_TRY_TO_FREEZE
LINUX_LINUX_KEYRING_SUPPORT
LINUX_KEY_ALLOC_NEEDS_STRUCT_TASK
LINUX_KEY_ALLOC_NEEDS_CRED
LINUX_INIT_WORK_HAS_DATA
LINUX_REGISTER_SYSCTL_TABLE_NOFLAG
LINUX_HAVE_DCACHE_LOCK
LINUX_D_COUNT_IS_INT
LINUX_IOP_GETATTR_TAKES_PATH_STRUCT
LINUX_IOP_MKDIR_TAKES_UMODE_T
LINUX_IOP_CREATE_TAKES_UMODE_T
LINUX_EXPORT_OP_ENCODE_FH_TAKES_INODES
LINUX_KMAP_ATOMIC_TAKES_NO_KM_TYPE
LINUX_DENTRY_OPEN_TAKES_PATH
LINUX_D_ALIAS_IS_HLIST
LINUX_HLIST_ITERATOR_NO_NODE
LINUX_IOP_I_CREATE_TAKES_BOOL
LINUX_DOP_D_REVALIDATE_TAKES_UNSIGNED
LINUX_IOP_LOOKUP_TAKES_UNSIGNED
LINUX_D_INVALIDATE_IS_VOID
LINUX_KERNEL_READ_OFFSET_IS_LAST
LINUX_KEYRING_SEARCH_TAKES_RECURSE
])


AC_DEFUN([OPENAFS_LINUX_KERNEL_MORE_ASSORTED_CHECKS],[
if test -f "$LINUX_KERNEL_PATH/include/linux/in_systm.h"; then
    AC_DEFINE(HAVE_IN_SYSTM_H, 1, [define if you have in_systm.h header file])
fi
if test -f "$LINUX_KERNEL_PATH/include/linux/mm_inline.h"; then
    AC_DEFINE(HAVE_MM_INLINE_H, 1, [define if you have mm_inline.h header file])
fi
if test "x$ac_cv_linux_func_page_get_link" = "xyes" -o "x$ac_cv_linux_func_i_put_link_takes_cookie" = "xyes"; then
    AC_DEFINE(USABLE_KERNEL_PAGE_SYMLINK_CACHE, 1, [define if your kernel has a usable symlink cache API])
else
    AC_MSG_WARN([your kernel does not have a usable symlink cache API])
fi
if test "x$ac_cv_linux_func_page_get_link" != "xyes" -a "x$ac_cv_linux_struct_inode_operations_has_get_link" = "xyes"; then
    AC_MSG_ERROR([Your kernel does not use follow_link - not supported without symlink cache API])
    exit 1
fi
])
