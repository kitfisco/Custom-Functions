local a={}local b=loadstring(game:HttpGet("https://raw.githubusercontent.com/kitfisco/Custom-Functions/main/Connection.lua"))()setreadonly(Instance,false)do local c=Instance.new;Instance.new=function(d,e)local f=c(d)if e and type(e)=="table"then for g,h in pairs(e)do f[g]=h end end;return f end end;setreadonly(Instance,true)local function i(j)if j then j:Disconnect()j=nil end end;a.WaitForChildWhichIsA=function(self,k,l,m)local n=self:FindFirstChildWhichIsA(k)local o=b.new()if not n then local p;coroutine.wrap(function()wait(l or 5)if l then o:Invoke()else warn("Infinite yield possible on \""..self:GetFullName()..":WaitForChildWhichIsA(\""..k.."\")\"")end end)()local function q(r)if r:IsA(k)then n=r;o:Invoke()end end;if m then p=self.DescendantAdded:Connect(q)else p=self.ChildAdded:Connect(q)end;o.Invoked:Wait()i(p)end;return n end;a.WaitForChildOfClass=function(self,k,l,m)local n=self:FindFirstChildWhichIsA(k)local o=b.new()if not n then local p;coroutine.wrap(function()wait(l or 5)if l then o:Invoke()else warn("Infinite yield possible on \""..self:GetFullName()..":WaitForChildWhichIsA(\""..k.."\")\"")end end)()local function q(r)if r.ClassName==k then n=r;o:Invoke()end end;if m then p=self.DescendantAdded:Connect(q)else p=self.ChildAdded:Connect(q)end;o.Invoked:Wait()i(p)end;return n end;a.WaitForDescendantWhichIsA=function(self,s,l)return a.WaitForChildWhichIsA(self,s,l,true)end;a.WaitForAncestorWhichIsA=a.WaitForDescendantWhichIsA;a.WaitForDescendantOfClass=function(self,s,l)return a.WaitForChildOfClass(self,s,l,true)end;a.WaitForAncestorOfClass=a.WaitForDescendantOfClass;a.GetChildrenWhichAre=function(self,k,m)local n={}local t;if m then t=self:GetDescendants()else t=self:GetChildren()end;if t and#t>0 then for u,r in pairs(t)do if r and r:IsA(k)then table.insert(n,r)end end end;return n end;a.GetChildrenOfClass=function(self,k,m)local n={}local t;if m then t=self:GetDescendants()else t=self:GetChildren()end;if t and#t>0 then for u,r in pairs(t)do if r and r.ClassName==k then table.insert(n,r)end end end;return n end;a.GetDescendantsWhichAre=function(self,k)return a.GetChildrenWhichAre(self,k,true)end;a.GetDescendantsOfClass=function(self,k)return a.GetChildrenOfClass(self,k,true)end;a.WaitForDescendant=function(self,s,l)local n=self:FindFirstChild(s,true)local o=b.new()if not n then local p;coroutine.wrap(function()wait(l or 5)if l then o:Invoke()else warn("Infinite yield possible on \""..self:GetFullName()..":WaitForDescendant(\""..s.."\")\"")end end)()local function q(r)if r.Name==s then n=r;o:Invoke()end end;p=self.DescendantAdded:Connect(q)o.Invoked:Wait()i(p)end;return n end;a.WaitForAncestor=a.WaitForDescendant;a.GetChildrenWhichName=function(self,s,m)local n={}local t;if m then t=self:GetDescendants()else t=self:GetChildren()end;if t and#t>0 then for u,r in pairs(t)do if r and r.Name==s then table.insert(n,r)end end end;return n end;a.GetDescendantWithName=function(self,s)return a.GetChildrenWhichName(self,s,true)end;a.FindNextChild=function(self,...)local v={...}local r,w=self,0;for u,x in pairs(v)do local y=r:FindFirstChild(x)if y then r=y;w=w+1 end end;if w==#v then return r end end;a.FindNextChildWhichIsA=function(self,...)local v={...}local r,w=self,0;for u,x in pairs(v)do local y=r:FindFirstChildWhichIsA(x)if y then r=y;w=w+1 end end;if w==#v then return r end end;a.FindNextChildOfClass=function(self,...)local v={...}local r,w=self,0;for u,x in pairs(v)do local y=r:FindFirstChildOfClass(x)if y then r=y;w=w+1 end end;if w==#v then return r end end;do local z;z=hookmetamethod(game,"__index",newcclosure(function(self,A)if checkcaller()and a[A]then return a[A]end;return z(self,A)end))end;do local B;B=hookmetamethod(game,"__namecall",newcclosure(function(self,...)local C=getnamecallmethod()if checkcaller()and a[C]then return a[C](self,...)end;return B(self,...)end))end
